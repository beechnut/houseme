class City < ActiveHash::Base
  fields :craigslist_prefix, :name, :neighborhoods,
         :craigslist_core_path, :craigslist_apt_path
  # has_many :housing_preferences

  include ActiveModel::Validations
  validates :name,                 presence: true
  validates :craigslist_prefix,    presence: true
  validates :neighborhoods,        presence: true
  validates :craigslist_core_path, presence: true
  validates :craigslist_apt_path,  presence: true

  def craigslist_url
    url = "http://#{@craigslist_prefix}.craigslist.org"
    url << "/#{@craigslist_core_path}" unless @craigslist_core_path.nil?
  end


  # Data Input

  create id: 1, name: "Boston", craigslist_prefix: "boston", craigslist_core_path: "gbs",
                craigslist_apt_path: "aap/",
                neighborhoods: ["Dorchester", "Back Bay", "South End", "Jamaica Plain"]
  create id: 2, name: "San Francisco", craigslist_prefix: "sfbay",
                craigslist_apt_path: "apa/",
                neighborhoods: ["North Beach / Telegraph Hill", "SOMA / South Beach", "Cupertino"]
end