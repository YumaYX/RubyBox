require 'minitest/autorun'
require './lib/YSMod2'

class YSMod2Test < Minitest::Test

  def setup
    @test_data_dir = './test/data'
  end

  def test_YSMarkdown_file_2_html
    exptected = <<~EOS
      <h1>RubyBox</h1>
      <p>This is a sample markdown file.</p>
      EOS
    assert_equal exptected, YSMod2.YSMarkdown_file_2_html(@test_data_dir + '/YSSampleData.md')
    assert_nil YSMod2.YSMarkdown_file_2_html('not_exist')
  end
  
end
