$('#neighborhood').empty()
<% @neighborhoods.each_with_index do |neighborhood, index| %>
$('#neighborhood').append($("<option></option>").attr("value",<%= index %>).text('<%= neighborhood %>'))
<% end %>