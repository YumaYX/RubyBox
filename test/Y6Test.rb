require 'minitest/autorun'
require './lib/Y6'

class Y6Test < Minitest::Test

  def setup
    @test_data_dir = './test/data'
  end

  def test_markdown_file_2_html
    exptected = <<~EOS
      <h1>RubyBox</h1>
      <p>This is a sample markdown file.</p>
      EOS
    assert_equal exptected, Y6.markdown_file_2_html(@test_data_dir + '/YSSampleData.md')
    assert_nil Y6.markdown_file_2_html('not_exist')
  end
  
  def test_get_sha256
     assert_equal 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', Y6.get_sha256('a')
     assert_equal '3e23e8160039594a33894f6564e1b1348bbd7a0088d42c4acb73eeaed59c009d', Y6.get_sha256('b')
  end

end
