require 'minitest/autorun'
require './lib/Y3'

class Y3Test < Minitest::Test

  def setup
    @test_data = './test/data'
    @arr = ['K', 'L', 'M', 'N']
  end

  def test_extract_json_file_2_hash
    assert_equal( {"key"=>"value"} , Y3.extract_json_file_2_hash( @test_data + '/YSSampleData.json') )
  end

  def test_extract_text_file_2_array
    assert_equal( ['{',"\t" + '"key":"value"','}'] , Y3.extract_text_file_2_array( @test_data + '/YSSampleData.json') )
  end

  def test_banner
    assert_equal'######################################## text' , Y3.banner('text')
  end

  def test_extract_array_before_include
    assert_equal( ['K'] , Y3.extract_array_before_include(@arr, 'K'))
    assert_equal( ['K', 'L', 'M'] , Y3.extract_array_before_include(@arr, 'M'))
    assert_equal( ['K', 'L', 'M', 'N'] , Y3.extract_array_before_include(@arr, 'N'))
    assert_equal( ['K', 'L', 'M', 'N'] , Y3.extract_array_before_include(@arr, 'X'))
    assert_equal( ['K'] , Y3.extract_array_before_include(@arr, '.*'))
  end

  def test_extract_array_after_include
    assert_equal( ['N'] , Y3.extract_array_after_include(@arr, 'N'))
    assert_equal( ['L', 'M', 'N'] , Y3.extract_array_after_include(@arr, 'L'))
    assert_equal( ['K', 'L', 'M', 'N'] , Y3.extract_array_after_include(@arr, 'K'))
    assert_equal( ['K', 'L', 'M', 'N'] , Y3.extract_array_after_include(@arr, 'X'))
    assert_equal( ['K', 'L', 'M', 'N'] , Y3.extract_array_after_include(@arr, '.'))
    assert_equal( ['K', 'L', 'M', 'N'] , Y3.extract_array_after_include(@arr, '.*'))
  end

  def test_compare_arrays
    array =[ 'a','b','c','d']
    pattern = ['b','c','x']
    exptected = ["a","[INCLUDE] b","[INCLUDE] c", "d"]
    assert_equal exptected , Y3.compare_arrays(array, pattern)
  end

  
end
