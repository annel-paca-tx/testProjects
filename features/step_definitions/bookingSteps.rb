Given(/^I Open Booking\.com search screen$/) do
  sleep (4.seconds)
end

When(/^I tap on the "([^"]*)" input field$/) do |arg|
  xpath("//android.widget.EditText[@resource-id=\"com.booking:id/search_searchInput\"]").click
end

And(/^I fill in enter destination input with "(.*)"$/) do |arg|
  xpath("//android.widget.EditText[@resource-id=\"com.booking:id/disam_search\"]").type "#{arg}"
  sleep(3.seconds)
  xpath("//android.widget.LinearLayout[@index=\"0\"]").click
end

And(/^I select a date$/) do
  xpath("//android.widget.TextView[@index=\"41\"]").click
end

And(/^I click on Let's go$/) do
  xpath("//android.widget.Button[@resource-id=\"com.booking:id/search_search\"]").click
end

Then(/^I should see "([^"]*)" in the result list$/) do |arg|
  sleep (2.seconds)
  xpath("//android.widget.ImageButton[@index=\"0\"]").click
  text = xpath("//android.widget.EditText[@resource-id=\"com.booking:id/search_searchInput\"]").text
  expect(text).to eq("#{arg}");
end
# Verify that modification done in More Option are apply in the search.
And(/^I choice room on "([^"]*)" from More options$/) do |arg|
 xpath("//android.widget.LinearLayout[@index=\"3\"]").click

 number_room = xpath("//android.widget.RelativeLayout[@resource-id='com.booking:id/rooms_count_box']/child::android.widget.LinearLayout/child::android.widget.TextView[@index='1']").text
 number_roomInt = number_room.to_i
   while number_roomInt < ("#{arg}").to_i do
     xpath("//android.widget.RelativeLayout[@resource-id='com.booking:id/rooms_count_box']/child::android.widget.LinearLayout/child::android.widget.ImageView[@index='2']").click
     number_roomInt += 1
   end
end

And(/^I choice adults on "([^"]*)" from More options$/) do |arg|
  number_adults = xpath("//android.widget.RelativeLayout[@resource-id='com.booking:id/adults_count_box']/child::android.widget.LinearLayout/child::android.widget.TextView[@index='1']").text
  number_adultsInt = number_adults.to_i
  while number_adultsInt < ("#{arg}").to_i do
    xpath("//android.widget.RelativeLayout[@resource-id='com.booking:id/adults_count_box']/child::android.widget.LinearLayout/child::android.widget.ImageView[@index='2']").click
    number_adultsInt += 1
  end
end

And(/^I choice children on "([^"]*)" from More options$/) do |arg|
  number_children = xpath("//android.widget.RelativeLayout[@resource-id='com.booking:id/children_count_box']/child::android.widget.LinearLayout/child::android.widget.TextView[@index='1']").text
  number_childrenInt = number_children.to_i
  while number_childrenInt < ("#{arg}").to_i do
    xpath("//android.widget.RelativeLayout[@resource-id='com.booking:id/children_count_box']/child::android.widget.LinearLayout/child::android.widget.ImageView[@index='2']").click
    number_childrenInt += 1
  end

  xpath("//android.widget.Button[@resource-id=\"android:id/button1\"]").click
end

Then(/^I should see "([^"]*)" with "([^"]*)" and "([^"]*)" "([^"]*)" choice previously$/) do |arg1, arg2, arg3, arg4|

  sleep (3.seconds)
  xpath("//android.widget.ImageButton[@index=\"0\"]").click

    name_hotel = xpath("//android.widget.EditText[@resource-id=\"com.booking:id/search_searchInput\"]").text
    number_rooms = xpath("//android.widget.TextView[@resource-id=\"com.booking:id/room_count\"]").text
    number_adults = xpath("//android.widget.TextView[@resource-id=\"com.booking:id/adult_count\"]").text
    number_children = xpath("//android.widget.TextView[@resource-id=\"com.booking:id/children_count\"]").text

    expect(name_hotel).to eq("#{arg1}");
    expect(number_rooms).to eq("#{arg2}");
    expect(number_adults).to eq("#{arg3}");
    expect(number_children).to eq("#{arg4}");

end

#Verify that modification done in Travelling are apply in the search.

And(/^I choice "([^"]*)" from Main menu$/) do |arg|
  xpath("//android.widget.RadioButton[@resource-id=\"com.booking:id/business_purpose_#{arg}\"]").click
end

Then(/^I should see "([^"]*)" with "([^"]*)" option choice previously$/) do |arg1, arg2|

  sleep (3.seconds)
  xpath("//android.widget.ImageButton[@index=\"0\"]").click

  name_hotel = xpath("//android.widget.EditText[@resource-id=\"com.booking:id/search_searchInput\"]").text
  travel_feature = xpath("//android.widget.RadioButton[@resource-id=\"com.booking:id/business_purpose_#{arg2}\"]").text
  expect(name_hotel).to eq("#{arg1}");
  expect(travel_feature.upcase).to eq(("#{arg2}").upcase);

end