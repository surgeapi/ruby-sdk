# frozen_string_literal: true

require_relative "../test_helper"

class Surge::Test::Resources::MessagesTest < Surge::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @surge.messages.create(
        "acct_01j9a43avnfqzbjfch6pygv1td",
        conversation: {contact: {phone_number: "+18015551234"}}
      )

    assert_pattern do
      response => Surge::Message
    end

    assert_pattern do
      response => {
        id: String | nil,
        attachments: ^(Surge::Internal::Type::ArrayOf[Surge::Message::Attachment]) | nil,
        body: String | nil,
        conversation: Surge::Message::Conversation | nil
      }
    end
  end
end
