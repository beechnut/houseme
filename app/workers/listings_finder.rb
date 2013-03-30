require 'open-uri'

class ListingsFinder

  # TODO: Break and schedule for later if Craigslist doesn't respond
  
  @queue = :listings_queue

  BASE_CRAIGSLIST_URL = "craigslist.org"

  CRAIGSLIST_QUERY_PARAMS = {
    additional_search_terms: "query",
    min_rent: "minAsk",
    max_rent: "maxAsk",
    bedrooms: "bedrooms"
  }


  def self.perform
    puts "Start the jarb"
                             # TODO: Remove limit in production
    User.where(active: true).limit(2).each do |user|
      @send_email = false

      user.housing_preferences.each do |pref|
        puts "#{pref}"
        get_listings_for pref
      end

      if @send_email
        ListingsNotifier.listings_email( user ).deliver 
        ListingsNotifier.listings_text ( user ).deliver
      end
    end
  end
  

  def self.get_listings_for(pref)    
    path  = build_path_for  pref
    query = build_query_for pref

    page_url = "http://" + pref.city.craigslist_prefix + "." + BASE_CRAIGSLIST_URL + "/search" + path + "?zoomToPosting=&srchType=A&" + query
    page = Nokogiri::HTML(open(page_url))
    listings = page.css('blockquote#toc_rows p.row')[0..2]

    save_new listings, pref
  end



  def self.save_new(listings, pref)
      
      for listing in listings do

        listing_url = listing.css('span.pl a').first["href"]

        unless Listing.find_by_url( listing_url ) do
          @send_email = true
          title = listing.css('span.pl a').first.children.text
          cost_and_bedrooms = listing.css('span.itempnr').children.first.text
          cost = cost_and_bedrooms.match(/\$\d+/).to_s.to_i
          bedrooms = cost_and_bedrooms.match(/\d+br/).to_s.to_i

          respond_email = Nokogiri::HTML(open(listing_url)).css("section.dateReplyBar a").first["href"]
          respond_email = respond_email.gsub("mailto:", '')
          puts " #### " + respond_email

          listing = pref.listings.build(title: title, url: listing_url, bedrooms: bedrooms, cost: cost, respond_email: respond_email)
          if listing.save
            puts '\t Listing Saved'
            pref.listings.order('created_at DESC').last.destroy if pref.listings.count > 3
          else
            puts listing.errors.full_messages
          end

        end
      end
    end
  end



  def self.build_path_for(pref)
    path = "/"
    pref.housing_type == "room" ? path << "roo/" : path << pref.city.craigslist_apt_path
    path << pref.city.craigslist_core_path unless pref.city.craigslist_core_path.nil?
    return path.to_s
  end



  def self.build_query_for(pref)
    query_string = ""
    for property in HousingPreference.accessible_attributes do
      # puts property, CRAIGSLIST_QUERY_PARAMS[property.to_sym].nil?, pref[property.to_s]
      unless CRAIGSLIST_QUERY_PARAMS[property.to_sym].nil?
        query_string << CRAIGSLIST_QUERY_PARAMS[property.to_sym]
        query_string << "="
        query_string << pref[property].to_s unless pref[property].nil?
        query_string << "&"
      end
    end
    return query_string
  end

end