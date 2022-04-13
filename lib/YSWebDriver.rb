#!/usr/bin/env ruby

require 'selenium-webdriver'

class YSWebDriver

  attr_reader :driver
  attr_writer :url
  attr_writer :window_width, :window_height

  def initialize(url = '')
    @url = url
    @window_width, @window_height = 800, 600
    prepareWebDriver
  end

  def accessUrl
    @driver.get(@url)
  end

  def getContent
    @driver.page_source.encode('utf-8')
  end

  def saveScreenshot(image_path="screenshot.png")
    @driver.save_screenshot('./' + image_path)
  end

  private

  def prepareWebDriver
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    @driver = Selenium::WebDriver.for :chrome, capabilities: [options]
    @driver.manage.window.resize_to(@window_width, @window_height)
  end

end
