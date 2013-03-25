KEY_TO_QUERY = { key: "key_string_for_query" }

RESULTS_SELECTOR = "something_with_css"
RESULTS_TITLE_SELECTOR = "something_with_css_within_results_to_get_titles"
RESULTS_URL_SELECTOR = "something_else_with_css_within_results_to_get_paths"

users = User.all

users.each do |user|
  user.housing_preferences.each do |pref|
    results = get_results_from pref
    send_an_email_to(user, results)
  end
end

def get_results_from(pref) do # pref, site once multiple sites
  city_prefix = pref.city.craigslist_prefix
  city_url = "http://#{city_prefix}.craigslist.com"
  query = build_query_from pref
  url = "#{city_url}/#{query}"
  return crawl_the url
end

def build_query_from(params) do
  query = ""
  for key, value in params do
    query << translate_key_to_query key
    query << translate_value_to_query value
  end
  return query
end

def translate_key_to_query(key) do
  KEY_TO_QUERY[key]
end

def crawl_the(url)
  page = Nokogiri::HTML(open url)
  results_content = page.css(RESULTS_SELECTOR)
  results_links   = results_content.css(RESULTS_URL_SELECTOR)
  results_titles  = results_content.css(RESULTS_TITLE_SELECTOR)
  
end


