HouseMe
=======

*Limited to the Boston area only at the moment. We plan to offer more cities in the future.*

Sign up for HouseMe and tell us your housing preferences.  

We'll crawl the web for you, looking for housing on a number of major housing websites. If we've found new housing posts that match what you're looking for, we'll send you an email and/or text alert.

### Housing websites
+ Craigslist


TODO
----------------

### Top Priority for 0.1.0 (Mar 29)

+ Crawl task
  + get it to send email alerts, text alerts
  + resque-scheduler to run mid-day crawls
+ Views for results


### Mid-Priority for 0.1.1 (Apr 2)

+ Emails:
  + Forgot password
  + Account confirmation
+ Human validation
+ Index page displays something different for signed-in users

### Mid-Priority for 0.1.2 (Apr 6)

+ Multiple major cities, fully fleshed out
+ Review & Reply functionality
  + Editable autointro
  + jQuery removal of 'Review & Reply' links
+ First search happens on signup?


### Low Priority

+ Write a test & validation to prevent PUT request from creating > 3 listings
+ Signup form to build one associated housing preference
  + Note: the way to do this is through accept_nested_attributes_for or something along those lines  
+ Migrate database from SQL => KVS


### Long-Term

+ Premium account
  + Payment with Stripe
  + Free for first X users
  + More frequent searches and alerts.
+ Def Twitter DMs. # maybe private Facebook posts essentially / a woof
+ Adaptive rent: Fill in the blanks: "I'd be willing to pay $____ more if the apartment has ____."
+ Inline photos.
