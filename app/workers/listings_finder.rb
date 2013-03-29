require 'open-uri'

class ListingsFinder

  # TODO: Break and schedule for later if Craigslist doesn't respond
  
  @queue = :listings_queue

  BASE_CRAIGSLIST_URL = "craigslist.org"

  CRAIGSLIST_PATH_PARAMS = {
    room: "roo",
    apartment: "aap"
  }

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
      user.housing_preferences.each do |pref|
        puts "#{pref}"
        get_listings_for pref
      end
    end
    puts "End the jarb"

  end
  

  def self.get_listings_for(pref)
    # http://boston.craigslist.org/search/aap/gbs?zoomToPosting=&query=stunning&srchType=A&minAsk=500&maxAsk=1900&bedrooms=1
    path = build_path_for pref
    query = "query=stunning&minAsk=500&maxAsk=1900&bedrooms=1"

    page_url = "http://" + pref.city.craigslist_prefix + "." + BASE_CRAIGSLIST_URL + "/search" + path + "?zoomToPosting=&srchType=A&" + query
    page = Nokogiri::HTML(open(page_url))
    listings = page.css('blockquote#toc_rows p.row')[0..2]

    save_new listings, pref
  end



  def self.save_new(listings, pref)
     
      for listing in listings do

        listing_url = listing.css('span.pl a').first["href"]

        unless Listing.find_by_url( listing_url ) do
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

=begin

  def self.build_query_for(pref)
    query_string = ""

    for attribute in HousingPreference.accessible_attributes do
      query_string << CRAIGSLIST_QUERY_PARAMS[attribute.to_s] # TODO: Is to_s nec? Best access?
      query_string << "="
      query_string << HousingPreference[attribute.to_s] # Best access?
      query_string << "&" # does this F up the last one?
    end
  end



  

=end

end