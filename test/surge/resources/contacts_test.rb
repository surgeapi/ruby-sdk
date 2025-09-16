# frozen_string_literal: true

require_relative "../test_helper"

class Surge::Test::Resources::ContactsTest < Surge::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @surge.contacts.create("acct_01j9a43avnfqzbjfch6pygv1td", phone_number: "+18015551234")

    assert_pattern do
      response => Surge::Contact
    end

    assert_pattern do
      response => {
        id: String,
        phone_number: String,
        email: String | nil,
        first_name: String | nil,
        last_name: String | nil,
        metadata: ^(Surge::Internal::Type::HashOf[String]) | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @surge.contacts.retrieve("ctc_01j9dy8mdzfn3r0e8x1tbdrdrf")

    assert_pattern do
      response => Surge::Contact
    end

    assert_pattern do
      response => {
        id: String,
        phone_number: String,
        email: String | nil,
        first_name: String | nil,
        last_name: String | nil,
        metadata: ^(Surge::Internal::Type::HashOf[String]) | nil
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @surge.contacts.update("ctc_01j9dy8mdzfn3r0e8x1tbdrdrf", phone_number: "+18015551234")

    assert_pattern do
      response => Surge::Contact
    end

    assert_pattern do
      response => {
        id: String,
        phone_number: String,
        email: String | nil,
        first_name: String | nil,
        last_name: String | nil,
        metadata: ^(Surge::Internal::Type::HashOf[String]) | nil
      }
    end
  end
end
