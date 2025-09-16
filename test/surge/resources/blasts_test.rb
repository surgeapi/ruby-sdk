# frozen_string_literal: true

require_relative "../test_helper"

class Surge::Test::Resources::BlastsTest < Surge::Test::ResourceTest
  def test_create
    skip("Prism tests are disabled")

    response = @surge.blasts.create("acct_01j9a43avnfqzbjfch6pygv1td")

    assert_pattern do
      response => Surge::Blast
    end

    assert_pattern do
      response => {
        id: String | nil,
        attachments: ^(Surge::Internal::Type::ArrayOf[Surge::Blast::Attachment]) | nil,
        body: String | nil,
        name: String | nil,
        send_at: Time | nil
      }
    end
  end
end
