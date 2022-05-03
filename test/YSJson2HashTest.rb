require 'minitest/autorun'
require_relative './../lib/YSJson2Hash'

class YSJson2HashTest < Minitest::Test

  def test_json2hash
    h1 = YSJson2Hash.new('./test/data/YSSampleData.json')
    assert_equal({"key"=>"value"}, h1.json_hash)
  end
end