# frozen_string_literal: true

require_relative "../test_helper"

class SurgeAPI::Test::Resources::PhoneNumbersTest < SurgeAPI::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @surge.phone_numbers.list("acct_01j9a43avnfqzbjfch6pygv1td")

    assert_pattern do
      response => SurgeAPI::Models::PhoneNumberListResponse
    end

    assert_pattern do
      response => {
        data: ^(SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::PhoneNumber]),
        pagination: SurgeAPI::Models::PhoneNumberListResponse::Pagination
      }
    end
  end

  def test_purchase
    skip("Prism tests are disabled")

    response = @surge.phone_numbers.purchase("acct_01j9a43avnfqzbjfch6pygv1td")

    assert_pattern do
      response => SurgeAPI::PhoneNumber
    end

    assert_pattern do
      response => {
        id: String,
        number: String,
        type: SurgeAPI::PhoneNumber::Type
      }
    end
  end
end
