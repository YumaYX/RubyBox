require 'minitest/autorun'

require './lib/YSDef'

class YSDefTest < Minitest::Test

  def setup
    @test_data = './test/data'
    @d = YSDef.new
  end

  def test_YSExtract_json_2_hash
    assert_equal( {"key"=>"value"} , @d.YSExtract_json_2_hash( @test_data + '/YSSampleData.json') )
  end

  def test_YSExtract_json_2_array
    assert_equal( ['{',"\t" + '"key":"value"','}'] , @d.YSExtract_json_2_array( @test_data + '/YSSampleData.json') )
  end

  def test_YSBanner
    assert_equal'######################################## text' , @d.YSBanner('text')
  end
  
end
