require 'minitest/autorun'
require_relative './../lib/Y3'

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

  def test_extract_csv_file_2_array
    assert_equal( [['1', '2'], ['ABC', 'XYZ']] , Y3.extract_csv_file_2_array( @test_data + '/YSSampleData.csv') )
  end

  def test_banner
    assert_output("######################################## text\n") {
      Y3.banner('text')
    }
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

  def test_extract_line_range
    assert_equal( @arr , Y3.extract_line_range(@arr,'K','N',) )
    assert_equal( ['L', 'M', 'N'] , Y3.extract_line_range(@arr,'L','N',) )
    assert_equal( ['L', 'M'] , Y3.extract_line_range(@arr,'L','M',) )
    assert_equal( ['L'] , Y3.extract_line_range(@arr,'L','L',) )
    assert_equal( @arr , Y3.extract_line_range(@arr,'','',) )
  end

  def test_diff_hourmin
    require 'date'
    d1 = DateTime.new(1999,7,31,12,34,00)
    d2 = DateTime.new(1999,7,31,13,44,00)
    assert_equal( "1:10", Y3.calc_time_diff(d1,d2) )
    assert_equal( "-1:50", Y3.calc_time_diff(d2,d1) )
    d3 = DateTime.new(1999,8,1, 9,45,00)
    assert_equal( "21:11", Y3.calc_time_diff(d1,d3) )
  end

  def test_count_appearance_frequency
    assert_equal({:K=>1,:L=>1,:M=>1,:N=>1}, Y3.count_appearance_frequency(@arr))
    array=['a1','a2','a2']
    assert_equal({:a1=>1,:a2=>2}, Y3.count_appearance_frequency(array))
    assert_equal({}, Y3.count_appearance_frequency([]))
  end

  def test_info
    assert_output("[INFO]: info\n") {
      Y3.info "info"
    }
    assert_output("[INFO]: infoargv2\n") {
      Y3.info "info" "argv2"
    }
  end

  def test_warn
    assert_output("[WARN]: warn\n") {
      Y3.warn "warn"
    }
    assert_output("[WARN]: warnargv2\n") {
      Y3.warn "warn" "argv2"
    }
  end

  def test_erb_2_string
    assert_equal("0\n1\n2\n", Y3.erb_2_string(@test_data + '/YSSampleData.erb'))
  end

end
