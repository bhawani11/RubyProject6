    require 'selenium-webdriver'
    driver = Selenium::WebDriver.for :chrome
    # driver = Selenium::WebDriver.for :Chrome.driver_path="D:\Eminence_square\chromedriver.exe"
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)

    def document_initialised(driver)
      driver.execute_script('return initialised')
    end

    # begin



        driver.get 'https://www.google.com'
      wait.until{|document_initialised| driver}
      search_form = driver.find_element(:css,"input[name='q']").text
      "Hello from JavaScript!".eql? search_form
        driver.manage.window.maximize
        driver.find_element(:css,"input[name='q']").send_keys 'selenium tutorial'
        sleep(5)
        driver.action.key_down(:shift).send_keys(:arrow_down).perform
        sleep(5)
        driver.action.key_down(:enter).key_up(:enter).perform
        sleep(10)
=begin

        element1=driver.find_element(:xpath,"(//div[@class='g']//h3)[#{i}]")
        sleep(4)
        driver.action.move_to(element1).perform
        sleep(5)
        #link element locator
        driver.find_element(:xpath,"(//div[@class='g']//h3)[#{i}]").click
        # element.replace('i','j')
        sleep(15)

                i+=1
        end
    # ensure
    #   driver.quit
    # end
=end
element1=driver.find_element(:xpath,"(//div[@class='g']//h3)")
    puts"#{element1}"
    for i in 1..10
      for j in 1..5
      driver.action.key_down(:shift).send_keys(:arrow_down).key_up(:shift).perform
=begin
      driver.action.key_down(:arrow_down).key_up(:arrow_down).perform
      driver.action.key_down(:arrow_down).key_up(:arrow_down).perform
      driver.action.key_down(:arrow_down).key_up(:arrow_down).perform
      sleep(4)


      driver.action.key_down(:arrow_down).key_up(:arrow_down).perform
      sleep(4)
=end
      end
      if i==3 ||i==4 || i==5 ||i==6
        next
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