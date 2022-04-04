require 'minitest/autorun'
require './lib/YSMod'

class YSModTest < Minitest::Test

  def setup
    @test_data = './test/data'
  end

  def test_YSExtract_json_2_hash
    assert_equal( {"key"=>"value"} , YSMod.YSExtract_json_2_hash( @test_data + '/YSSampleData.json') )
  end

  def test_YSExtract_json_2_array
    assert_equal( ['{',"\t" + '"key":"value"','}'] , YSMod.YSExtract_json_2_array( @test_data + '/YSSampleData.json') )
  end

  def test_YSBanner
    assert_equal'######################################## text' , YSMod.YSBanner('text')
  end
  
end
