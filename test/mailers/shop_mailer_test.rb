require 'test_helper'

class ShopMailerTest < ActionMailer::TestCase
  test "new_order_of_customer" do
    mail = ShopMailer.new_order_of_customer
    assert_equal "New order of customer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
