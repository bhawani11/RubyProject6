#Program for selenium tutorial task
# load in the webdriver gem to interact with Selenium
require 'selenium-webdriver'
#Run Chrome driver.exe to get chrome browser
driver = Selenium::WebDriver::Chrome.driver_path = "D:/Eminence_square/chromedriver.exe"
driver = Selenium::WebDriver.for :chrome
# use of explicit wait
wait = Selenium::WebDriver::Wait.new(:timeout => 20)

def document_initialised(driver)
  driver.execute_script('return initialised')
end

# begin
driver.get 'https://www.google.com'
#driver will wait untill locator is not visible
wait.until{|document_initialised| driver}
search_form = driver.find_element(:css,"input[name='q']").text
"Hello from JavaScript!".eql? search_form
#implicit wait
driver.manage.window.maximize
driver.manage.timeouts.implicit_wait = 20

search=driver.find_element(:css,"input[name='q']")
search.send_keys 'selenium tutorial'
sleep(5)
driver.action.key_down(:shift).send_keys(:arrow_down).perform
sleep(5)
driver.action.key_down(:enter).key_up(:enter).perform
sleep(8)

element1=driver.find_element(:xpath,"(//div[@class='g']//h3)")
puts"#{element1}"
for i in 1..10
  #for loop for scroll the page
  for j in 1..5
    driver.action.key_down(:shift).send_keys(:arrow_down).key_up(:shift).perform
    j=j+1
  end
  #if statement for skip i value
  if i==4 ||i==5 || i==6 ||i==7

    next
  end
  element=driver.find_element(:xpath,"(//div[@class='g']//h3)[#{i}]")
  sleep(4)
  puts"the title of link is #{element.text}"
  driver.action.move_to(element).perform
  sleep(5)
  #link element locator
  #  driver.find_element(:xpath,"(//div[@class='g']//h3)[#{i}]").click
  element.click
  sleep(12)
  driver.navigate.back
  sleep(12)
  driver.navigate.refresh
  sleep(10)
  i+=1
end