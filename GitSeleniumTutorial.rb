require "selenium-webdriver" # load in the webdriver gem to interact with Selenium
#Run Chromedriver.exe to get chrome browser
driver = Selenium::WebDriver.for :chrome
#Code will begin/start from here
begin
  # Navigate to URL
  driver.get 'https://google.com'
  driver.manage.timeouts.implicit_wait = 20
  # Enter "selenium tutorial" text and perform "ENTER" keyboard action
  driver.find_element(name: 'q').send_keys 'selenium tutorial'
  #to define wait state in script execution and it is fixed wait
  sleep(5)
  #here key_down is method of action class
  driver.action.key_down(:shift).send_keys(:arrow_down).perform
  sleep(5)
  driver.action.key_down(:enter).key_up(:enter).perform
  sleep(10)
  #loop statement
  i=1
  for i in 1..7
    driver.action.send_keys(:arrow_down).perform
    sleep(5)
    element=driver.find_element(:xpath,"((//*[@data-algo=\"0\"])/p/a/span/following-sibling::*[1])[#{i}]")
    driver.action.move_to(element).perform
    sleep(5)
    #link element locator
    driver.find_element(:xpath,"((//*[@data-algo=\"0\"])/p/a/span/following-sibling::*[1])[#{i}]").click
    sleep(5)
    #driver.navigate.back
    sleep(5)
    i=i+2
  end
  #  end of program
end
