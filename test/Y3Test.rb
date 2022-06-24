require 'minitest/autorun'
require_relative './../lib/Y3'

class Y3Test < Minitest::Test

  def setup
    @test_data = './test/data'
    @arr = ['K', 'L', 'M', 'N']
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

  def test_banner
    assert_output("######################################## text\n") {
      Y3.banner('text')
    }
  end

  #########################

  def test_extract_json_file_2_hash
    assert_equal( {"key"=>"value"} , Y3.extract_json_file_2_hash( @test_data + '/YSSampleData.json') )
    assert_equal( {"key"=>"value"} , Y3.make_jsonfile_hash(       @test_data + '/YSSampleData.json') )
  end

  def test_extract_text_file_2_array
    assert_equal( ['{',"\t" + '"key":"value"','}'] , Y3.extract_text_file_2_array( @test_data + '/YSSampleData.json') )
    assert_equal( ['{',"\t" + '"key":"value"','}'] , Y3.make_textfile_array(       @test_data + '/YSSampleData.json') )
  end

  def test_extract_csv_file_2_array
    assert_equal( [['1', '2'], ['ABC', 'XYZ']] , Y3.extract_csv_file_2_array( @test_data + '/YSSampleData.csv') )
    assert_equal( [['1', '2'], ['ABC', 'XYZ']] , Y3.make_csvfile_array(       @test_data + '/YSSampleData.csv') )
  end

  #########################

  def test_count_appearance_frequency
    assert_equal({:K=>1,:L=>1,:M=>1,:N=>1}, Y3.count_appearance_frequency(@arr))

    array=['a1','a2','a2']
    assert_equal({:a1=>1,:a2=>2},           Y3.count_appearance_frequency(array))
    
    assert_equal({},                        Y3.count_appearance_frequency([]))
  end


  def test_make_erbfile_string
    assert_equal("0\n1\n2\n", Y3.make_erbfile_string(@test_data + '/YSSampleData.erb'))
  end

  def test_file_writer
    temp_file_for_test = 'test_file.txt'
    exptect_contents   = "a\nb\nc\n"
    Y3.file_writer(temp_file_for_test, exptect_contents)

    assert_equal(exptect_contents, File.read(temp_file_for_test))

    File.delete(temp_file_for_test) if File.exist? temp_file_for_test
  end

end
