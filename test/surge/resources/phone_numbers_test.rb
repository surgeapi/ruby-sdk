# frozen_string_literal: true

require_relative "../test_helper"

class Surge::Test::Resources::PhoneNumbersTest < Surge::Test::ResourceTest
  def test_purchase
    skip("Prism tests are disabled")

    response = @surge.phone_numbers.purchase("acct_01j9a43avnfqzbjfch6pygv1td")

    assert_pattern do
      response => Surge::PhoneNumber
    end

    assert_pattern do
      response => {
        id: String,
        number: String,
        type: Surge::PhoneNumber::Type
      }
    end
  end
end
