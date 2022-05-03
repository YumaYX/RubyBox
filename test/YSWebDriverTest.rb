require 'minitest/autorun'
require_relative './../lib/YSWebDriver'

class YSWebDriverTest < Minitest::Test

  def setup
    @wd = YSWebDriver.new
  end

  def test_getWebPageTitle
    @wd.url = 'https://github.com/YumaYX/RubyBox'
    @wd.accessUrl
    assert_equal('GitHub - YumaYX/RubyBox', @wd.driver.title)
    @wd.driver.quit
  end
end