Given('the student is logged in') do
  @browser.navigate.to(@url)
  sleep(2)
  begin
    @browser.find_element(:id, "username").send_keys("student")
    @browser.find_element(:id, "password").send_keys("password")
    @browser.find_element(:id, "login_btn").click()
    sleep(1)
  rescue Exception => e
  end
end

When('they try to edit a {string}') do |resource|
  @browser.navigate.to(@url + resource + 's/1/edit')
end

Then('they should be redirected to an error page') do
  raise "Fail" if @browser.current_url != @url + 'errors/forbidden'
end