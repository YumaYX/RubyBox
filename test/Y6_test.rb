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
  
end
