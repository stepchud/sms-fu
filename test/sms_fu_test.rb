require File.dirname(__FILE__) + '/test_helper'

class SmsFuTest < Test::Unit::TestCase
  def setup
    @client = SMSFu::Client.new
  end

  def test_validity_of_number
    assert_raise(SMSFuException) { @client.deliver("456789011","AT&T","Message") }
    assert_equal("5555555555@txt.att.net", SMSFu.sms_address("1-555-555-5555","AT&T"))
  end

  def test_international_number
    assert_equal("+445555555555@txt.att.net", SMSFu.sms_address("+44-555-555-5555","AT&T"))
  end

  def test_handling_of_blank_message
    assert_raise(SMSFuException) { @client.deliver("1234567890","AT&T","") }
  end

  def test_get_sms_address
    assert_equal("1234567890@txt.att.net", SMSFu.sms_address("1234567890","AT&T"))
  end

  def test_use_mms_address
    assert_equal("1234567890@mms.att.net", SMSFu.sms_address('1234567890','AT&T',true))
  end
end
