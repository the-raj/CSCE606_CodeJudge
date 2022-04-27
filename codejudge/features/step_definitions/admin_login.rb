# https://cucumber.io/docs/guides/10-minute-tutorial/

Given('the admin is on the login page') do
  @browser.navigate.to(@url)
  sleep(2)
end

Given('the admin provides correct credentials') do
  @browser.find_element(:id, "username").send_keys("admin")
  @browser.find_element(:id, "password").send_keys("admin")
end

When('they click on the login button') do
  @browser.find_element(:id, "login_btn").click()
  sleep(1)
end

Then('they should get a positive feedback') do
  raise "Fail" if @browser.find_element(:id, "notice").text != "Logged in successfully"
end

Given('the admin provides incorrect credentials') do
  @browser.find_element(:id, "username").send_keys("admin")
  @browser.find_element(:id, "password").send_keys("incorrect")
end

Then('they should get a negative feedback') do
  raise "Fail" if @browser.find_element(:id, "notice").text != "Incorrect username or password"
end

Then('they can log out') do
  @browser.find_element(:id, "logout_btn").click()
  sleep(1)
  raise "Fail" if @browser.find_element(:id, "notice").text != "Logged Out"
end