# frozen_string_literal: true

require_relative "../test_helper"

class SurgeAPI::Test::Resources::MessagesTest < SurgeAPI::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @surge.messages.create(
        "acct_01j9a43avnfqzbjfch6pygv1td",
        conversation: {contact: {phone_number: "+18015551234"}}
      )

    assert_pattern do
      response => SurgeAPI::Message
    end

    assert_pattern do
      response => {
        id: String | nil,
        attachments: ^(SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::Message::Attachment]) | nil,
        body: String | nil,
        conversation: SurgeAPI::Message::Conversation | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @surge.messages.retrieve("msg_01j9e0m1m6fc38gsv2vkfqgzz2")

    assert_pattern do
      response => SurgeAPI::Message
    end

    assert_pattern do
      response => {
        id: String | nil,
        attachments: ^(SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::Message::Attachment]) | nil,
        body: String | nil,
        conversation: SurgeAPI::Message::Conversation | nil
      }
    end
  end
end
