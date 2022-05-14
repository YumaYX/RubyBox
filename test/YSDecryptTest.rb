require 'minitest/autorun'
require_relative './../lib/YSDecrypt'

class YSDecryptTest < Minitest::Test

  def setup
  	@d=YSDecrypt.new('./private.key', 'encrypted')
  end

  def test_decrypt
      assert_equal("abc\n" ,@d.decrypt)
  end

  def teardown
    ['./private.key', './public.key', './encrypted'].each do |temp|
      File.delete temp if File.exist?(temp)
    end
  end

end
