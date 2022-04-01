require 'minitest/autorun'

require './lib/YSDef'

class YSDefTest < Minitest::Test

  def setup
    @test_data = './test/data'
    @d = YSDef.new
  end

  def test_YSextract_json_2_hash
    assert_equal( {"key"=>"value"} , @d.YSextract_json_2_hash( @test_data + '/YSSampleData.json') )
  end

  def test_YSextract_json_2_array
    assert_equal( ['{',"\t" + '"key":"value"','}'] , @d.YSextract_json_2_array( @test_data + '/YSSampleData.json') )
  end

  def test_YSbanner
    assert_equal'######################################## text' , @d.YSbanner('text')
  end
  
end
