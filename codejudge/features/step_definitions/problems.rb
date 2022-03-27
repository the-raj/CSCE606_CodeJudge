Given('the admin is authenticated') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('the admin goes to the problems page') do
  @browser.navigate.to(@url + "problems/")
end

Given('they click on the {string} button') do |string|
  @browser.find_element(:id, string).click()
  sleep(1)
end

Given('they enter the problem details') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('they click on the {string} button') do |string|
  @browser.find_element(:id, string).click()
end

Then('the problem should be visible in the list') do
  pending # raise "Fail" if @browser.find_element(:id, "problems")
end

Given('a certain problem exists') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('they click on the {string} button of a certain problem') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Given('they enter the new values') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the problem should be updated to the new values') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the problem should not be visible in the list any more') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('they should see a list of problems') do
  pending # Write code here that turns the phrase above into concrete actions
end