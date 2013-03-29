require 'resque/tasks'
require 'resque_scheduler/tasks'

task 'resque:setup' => :environment
task 'resque:scheduler_setup' => :environment

# If we want to keep our workers light, however, 
# it might be worth implementing a customized solution 
# so that the entire Rails environment isn’t loaded.
# - http://railscasts.com/episodes/271-resque?view=asciicast