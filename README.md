HouseMe
=======

*Limited to the Boston area only at the moment. We plan to offer more cities in the future.*

Sign up for HouseMe and tell us your housing preferences.  

We'll crawl the web for you, looking for housing on a number of major housing websites. If we've found new housing posts that match what you're looking for, we'll send you an email and/or text alert.

### Housing websites
+ Craigslist

### Future housing websites, ideally
+ Harvard grad student housing (not actually limited to Harvard grad students)
+ MIT housing
+ Tufts Housing


TODO
----
+ Crawl task: Add resque and resque-scheduler to run hourly cron job web crawls for all active users.
+ Write a test & custom validation method to prevent access to create_h_p_path if there are 3 housing preferences
+ Actually assign neighborhood to housing preference
+ Signup form to build one associated housing preference
  + Note: the way to do this is through accept_nested_attributes_for or
    something along those lines
+ Index page displays something different for signed-in users
+ Review & reply: You'll be able to click a link in our email alert to you that sends to the housing poster a letter of interest you've pre-written.This will save you a million years.
  + jQuery removal of 'Review & Reply' links after click, spin, send
+ Require account confirmation via email
+ Multiple major cities, fully fleshed out
+ Migrate database from SQL => KVS
+ Premium accounts: more frequent searches and alerts.

*-------*
|       |
| prefs |  [edit]
|       |
*-------*
|       |
| prefs |  [edit]
|       |
*-------*
|       |
| [new] |
|       |
*-------*

LONG-TERM
---------
+ Premium account / payment with Stripe
+ Premium account is free for first X users
+ Def Twitter DMs. # maybe private Facebook posts essentially / a woof
+ Adaptive rent: Fill in the blanks: "I'd be willing to pay $____ more if the apartment has ____."
