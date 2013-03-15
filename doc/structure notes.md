apartmentsear.ch

Structure:
User =>
  has_many housing preferences
  :email, :password, :mobile, :carrier, :receive_text?
  :active (whether i should search for housing on behalf of this person)
     toggled with a (I Need Housing) (I Am Housed: don't search for me)
  :last_search (will only search if the last search was 45+ mins ago)

Housing Preferences =>
  :area (one of: )
  :additional_search_terms
  :min_rent, :max_rent


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







Housing Preference list:

`Search Now` button does a search and returns new links for each, but deactivates

| Preference | Post        |
|:-----------|:------------|
| South End  |         |
| 1+ BR      |       |
| $500-900   |        |

Preference unit  | link V link V link V link V link





















