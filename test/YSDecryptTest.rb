require 'minitest/autorun'
require './lib/YSDecrypt'

class YSDecryptTest < Minitest::Test

  def setup
  	@d=YSDecrypt.new('./private.key', 'encrypted')
  end

  def test_decrypt
      assert_equal("abc\n" ,@d.decrypt)
  end

end
