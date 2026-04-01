# frozen_string_literal: true

require_relative "../test_helper"

class SurgeAPI::Test::Resources::AudiencesTest < SurgeAPI::Test::ResourceTest
  def test_list_contacts
    skip("Mock server tests are disabled")

    response = @surge.audiences.list_contacts("aud_01j9a43avnfqzbjfch6pygv1td")

    assert_pattern do
      response => SurgeAPI::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => SurgeAPI::Contact
    end

    assert_pattern do
      row => {
        id: String,
        phone_number: String,
        email: String | nil,
        first_name: String | nil,
        last_name: String | nil,
        metadata: ^(SurgeAPI::Internal::Type::HashOf[String]) | nil
      }
    end
  end
end
