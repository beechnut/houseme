# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#housing_preference_city_id').change ->
    city_id = $('#housing_preference_city_id').val()
    $.ajax
      type: "POST"
      url: "http://" + location.host + "/housing_preferences/dynamic_neighborhoods/" + city_id
      data: city_id