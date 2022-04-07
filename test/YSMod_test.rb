require 'minitest/autorun'
require './lib/YSMod'

class YSModTest < Minitest::Test

  def setup
    @test_data = './test/data'
    @arr = ['K', 'L', 'M', 'N']
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

  def test_YSExtract_array_before_include
    assert_equal( ['K'] , YSMod.YSExtract_array_before_include(@arr, 'K'))
    assert_equal( ['K', 'L', 'M'] , YSMod.YSExtract_array_before_include(@arr, 'M'))
    assert_equal( ['K', 'L', 'M', 'N'] , YSMod.YSExtract_array_before_include(@arr, 'N'))
    assert_equal( ['K', 'L', 'M', 'N'] , YSMod.YSExtract_array_before_include(@arr, 'X'))
  end

  def test_YSExtract_array_after_include
    assert_equal( ['N'] , YSMod.YSExtract_array_after_include(@arr, 'N'))
    assert_equal( ['L', 'M', 'N'] , YSMod.YSExtract_array_after_include(@arr, 'L'))
    assert_equal( ['K', 'L', 'M', 'N'] , YSMod.YSExtract_array_after_include(@arr, 'K'))
    assert_equal( ['K', 'L', 'M', 'N'] , YSMod.YSExtract_array_after_include(@arr, 'X'))
  end
  
end
