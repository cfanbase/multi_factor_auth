require 'test_helper'

class MultiFactorAuthMethodsTest < Minitest::Test

  def setup
    @klass = Class.new
    @klass.extend MultiFactorAuth::Methods
  end

  def test_it_should_be_an_instance_of_QRCode
    instance = @klass.generate_qr_code 'https://www.google.com'
    assert instance.is_a?(RQRCode::QRCode)
  end
end
