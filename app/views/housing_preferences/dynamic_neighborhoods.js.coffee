$('#housing_preference_neighborhood').empty()
<% @neighborhoods.each_with_index do |neighborhood, index| %>
$('#housing_preference_neighborhood').append($("<option></option>").attr("value",<%= index %>).text('<%= neighborhood %>'))
<% end %>