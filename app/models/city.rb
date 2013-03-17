class City < ActiveHash::Base
  fields :craigslist_prefix, :name, :neighborhoods
  include ActiveModel::Validations

  validates :name, presence: true
  validates :craigslist_prefix, presence: true
  validates :neighborhoods, presence: true

  def craigslist_url
    "http://#{@craigslist_prefix}.craigslist.org"
  end


  # Data Input

  create id: 1, name: "Boston", craigslist_prefix: "boston",
                neighborhoods: ["Dorchester", "Back Bay", "South End", "Jamaica Plain"]
  create id: 2, name: "San Francisco", craigslist_prefix: "sfbay",
                neighborhoods: ["North Beach / Telegraph Hill", "SOMA / South Beach", "Cupertino"]
end