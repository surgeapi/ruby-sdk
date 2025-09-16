# frozen_string_literal: true

require_relative "../test_helper"

class SurgeAPI::Test::Resources::VerificationsTest < SurgeAPI::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @surge.verifications.create(phone_number: "+18015551234")

    assert_pattern do
      response => SurgeAPI::Verification
    end

    assert_pattern do
      response => {
        id: String,
        attempt_count: Integer,
        phone_number: String,
        status: SurgeAPI::Verification::Status
      }
    end
  end

  def test_check_required_params
    skip("Prism tests are disabled")

    response = @surge.verifications.check("vfn_01jayh15c2f2xamftg0xpyq1nj", code: "123456")

    assert_pattern do
      response => SurgeAPI::VerificationCheck
    end

    assert_pattern do
      response => {
        result: SurgeAPI::VerificationCheck::Result | nil,
        verification: SurgeAPI::Verification | nil
      }
    end
  end
end
