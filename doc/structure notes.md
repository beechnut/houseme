apartmentsear.ch

Structure:
User =>
  has_many housing preferences
  :email, :password, :mobile, :carrier, :receive_text?
  :active (whether i should search for housing on behalf of this person)
     toggled with a (I Need Housing) (I Am Housed: don't search for me)
  :last_search (will only search if the last search was 45+ mins ago)

Housing Preferences =>
  :city (one of: Boston, San Francisco)
  :apartment_type in: %w(apartment, room)
  :neighborhood (one of: city.neighborhoods)
  :additional_search_terms
  :bedrooms  in: %w(Any Studio 1+ 2+ 3+ 4+ 5+)
  :bathrooms in: %w(Any 1+ 1.5+ 2+ 2.5+ 3+)
  :min_rent, :max_rent

Site
  :name
  :url
  :search_query
    :location, :bedrooms, :bathrooms, :min_rent, :max_rent, :terms
  :result_area_selector
  :result_links_selector
  :result_titles_selector
  :result_prices_selector

Result store

City # doesn't need to be SQLite, could be KVS
  name: Boston
  neighborhoods (apartmentratings.com):
    Allston-Brighton
    Back Bay
    Chinatown
    Downtown
    East Boston
    Fenway-Kenmore
    Jamaica Plain
    North Dorchester
    Roxbury
    South Boston
    South Dorchester
    South End
  neighborhoods (homefind):
    Boston
    Dorchester
    Everett
    Hyde Park
    Lynn
    Somerville
  neighborhoods (boston.com/realestate):


  craigslist_prefix: boston


Crawl task =>
 For each person:
   For each of this person's housing preferences:
     For each housing website:
        Crawl housing website
      End
    End
    Send email, text
  End
End

Crawl housing website =>
  Use parameters in each URL type
  Crawl links to posts until you hit the last one | 5



{ verizon: "vtext.com", hash: "using below data" }

  def sms_suffix
    case self.carrier
    when "Alltel"
      "message.alltel.com"
    when "AT&T"
      "txt.att.net"
    when "Sprint"
      "messaging.sprintpcs.com"
    when "T-Mobile"
      "tmomail.net"
    when "Verizon"
      "vtext.com"
    end
  end

  def self.sms_address
    
  end




Housing Preference list:

`Search Now` button does a search and returns new links for each, but deactivates

| Preference | Post        |
|:-----------|:------------|
| South End  |         |
| 1+ BR      |       |
| $500-900   |        |

Preference unit  | link V link V link V link V link



BOSTON - ALLSTON
BOSTON - BACK BAY
BOSTON - BAY VILLAGE
BOSTON - BEACON HILL
BOSTON - BERKLEE COLLEGE AREA
BOSTON - BOSTON UNIVERSITY AREA
BOSTON - BRIGHAM CIRCLE
BOSTON - BRIGHTON
BOSTON - Brookline Line
BOSTON - CHARLES RIVER PARK
BOSTON - CHARLESTOWN
BOSTON - CHINATOWN
BOSTON - COPLEY SQUARE
BOSTON - DORCHESTER
BOSTON - DOWNTOWN
BOSTON - EAST BOSTON
BOSTON - EMERSON COLLEGE AREA
BOSTON - FENWAY
BOSTON - FINANCIAL DISTRICT
BOSTON - FORT HILL
BOSTON - FORT POINT
BOSTON - FORT POINT CHANNEL
BOSTON - GOVERNMENT CENTER
BOSTON - HYDE PARK
BOSTON - JAMAICA PLAIN
BOSTON - KENMORE SQUARE
BOSTON - LADDER DISTRICT
BOSTON - LEATHER DISTRICT
BOSTON - LONGWOOD
BOSTON - MATTAPAN
BOSTON - MISSION HILL
BOSTON - NEPONSET CIRCLE
BOSTON - NORTH END
BOSTON - NORTHEASTERN UNIV. AREA
BOSTON - PRUDENTIAL AREA
BOSTON - READVILLE
BOSTON - ROSLINDALE
BOSTON - ROXBURY
BOSTON - SEAPORT DISTRICT
BOSTON - SOUTH BOSTON
BOSTON - SOUTH END
BOSTON - SOUTH STATION
BOSTON - SUFFOLK UNIV. AREA
BOSTON - SYMPHONY
BOSTON - THEATER DISTRICT
BOSTON - WATERFRONT
BOSTON - WEST END
BOSTON - WEST ROXBURY
BROOKLINE - ASPINWALL HILL
BROOKLINE - BEACONSFIELD
BROOKLINE - BROOKLINE HILLS
BROOKLINE - BROOKLINE VILLAGE
BROOKLINE - BUTTONWOOD VILLAGE
BROOKLINE - CHESTNUT HILL
BROOKLINE - CLEVELAND CIRCLE
BROOKLINE - COOLIDGE CORNER
BROOKLINE - COREY FARM
BROOKLINE - COREY HILL
BROOKLINE - COTTAGE FARM
BROOKLINE - FISHER HILL
BROOKLINE - LONGWOOD
BROOKLINE - NORTH BROOKLINE
BROOKLINE - PILL HILL
BROOKLINE - PUTTERHAM CIRCLE
BROOKLINE - RUNKLE DISTRICT
BROOKLINE - SOUTH BROOKLINE
BROOKLINE - WASHINGTON SQUARE
BROOKLINE - WHISKEY POINT
CAMBRIDGE
CAMBRIDGE - AGASSIZ
CAMBRIDGE - AVON HILL
CAMBRIDGE - CAMBRIDGE HIGHLANDS
CAMBRIDGE - CAMBRIDGEPORT
CAMBRIDGE - CENTRAL SQUARE
CAMBRIDGE - COOLIDGE HILL
CAMBRIDGE - EAST CAMBRIDGE
CAMBRIDGE - FRESH POND
CAMBRIDGE - HARVARD SQUARE
CAMBRIDGE - Near Harvard
CAMBRIDGE - HURON VILLAGE
CAMBRIDGE - INMAN SQUARE
CAMBRIDGE - KENDALL SQUARE
CAMBRIDGE - MID CAMBRIDGE
CAMBRIDGE - NORTH CAMBRIDGE
CAMBRIDGE - PORTER SQUARE
CAMBRIDGE - RADCLIFFE
CAMBRIDGE - RIVERSIDE
CAMBRIDGE - STRAWBERRY HILL
CAMBRIDGE - WEST CAMBRIDGE









