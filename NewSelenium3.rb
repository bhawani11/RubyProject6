    require 'selenium-webdriver' # load in the webdriver gem to interact with Selenium
    #Run chromedriver.exe to get chrome browser
    driver = Selenium::WebDriver.for :chrome
    #to define wait state in script execution and it is explicitly wait
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      def document_initialised(driver)
      driver.execute_script('return initialised')
    end
    # begin
    #Code will begin/start from here
      driver.get 'https://www.google.com'
      #driver will wait untill element is not visibled
      wait.until{|document_initialised| driver}
      search_form = driver.find_element(:css,"input[name='q']").text
      "Hello from JavaScript!".eql? search_form
      driver.manage.window.maximize
    # Enter "selenium tutorial" text and perform "ENTER" keyboard action
      driver.find_element(:css,"input[name='q']").send_keys 'selenium tutorial'
      sleep(5)
    #here key_down is method of action class
    driver.action.key_down(:shift).send_keys(:arrow_down).perform
      sleep(5)
      driver.action.key_down(:enter).key_up(:enter).perform
      sleep(10)

      element1=driver.find_element(:xpath,"(//div[@class='g']//h3)")
      puts"#{element1}"
      for i in 1..10
      for j in 1..5
      driver.action.key_down(:shift).send_keys(:arrow_down).key_up(:shift).perform
      end
      if i==4 ||i==5 || i==6 ||i==7
      next
      sleep(2)
      driver.action.key_down(:shift).send_keys(:arrow_down).key_up(:shift).perform
      end
      element=driver.find_element(:xpath,"(//div[@class='g']//h3)[#{i}]")
      sleep(4)
      driver.action.move_to(element).perform
      sleep(5)
      #link element locator
      driver.find_element(:xpath,"(//div[@class='g']//h3)[#{i}]").click
       # element.replace('i','j')
      sleep(10)

      driver.navigate.back
      sleep(6)
      driver.navigate.refresh
      sleep(6)
       i+=1
      end