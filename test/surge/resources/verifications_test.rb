# frozen_string_literal: true

require_relative "../test_helper"

class Surge::Test::Resources::VerificationsTest < Surge::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @surge.verifications.create(phone_number: "+18015551234")

    assert_pattern do
      response => Surge::Verification
    end

    assert_pattern do
      response => {
        id: String,
        attempt_count: Integer,
        phone_number: String,
        status: Surge::Verification::Status
      }
    end
  end

  def test_check_required_params
    skip("Prism tests are disabled")

    response = @surge.verifications.check("vfn_01jayh15c2f2xamftg0xpyq1nj", code: "123456")

    assert_pattern do
      response => Surge::VerificationCheck
    end

    assert_pattern do
      response => {
        result: Surge::VerificationCheck::Result | nil,
        verification: Surge::Verification | nil
      }
    end
  end
end
