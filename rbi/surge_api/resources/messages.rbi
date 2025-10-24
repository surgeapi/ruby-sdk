# typed: strong

module SurgeAPI
  module Resources
    class Messages
      # Creates and enqueues a new message to be sent.
      #
      # Messages are always sent asynchronously. When you hit this endpoint, the message
      # will be created within Surge's system and enqueued for sending, and then the id
      # for the new message will be returned. When the message is actually sent, a
      # `message.sent` webhook event will be triggered and sent to any webhook endpoints
      # that you have subscribed to this event type. Then a `message.delivered` webhook
      # event will be triggered when the carrier sends us a delivery receipt.
      #
      # By default all messages will be sent immediately. If you would like to schedule
      # sending for some time up to 60 days in the future, you can do that by providing
      # a value for the `send_at` field. This should be formatted as an ISO8601 datetime
      # like `2028-10-14T18:06:00Z`.
      #
      # You must include either a `body` or `attachments` field (or both) in the request
      # body. The `body` field should contain the text of the message you want to send,
      # and the `attachments` field should be an array of objects with a `url` field
      # pointing to the file you want to attach. Surge will download these files and
      # send them as attachments in the message.
      #
      # You can provide either a `conversation` object or a `to` field to specify the
      # intended recipient of the message, but an error will be returned if both fields
      # are provided. Similarly the `from` field cannot be used together with the
      # `conversation` field, and `conversation.phone_number` should be specified
      # instead.
      sig do
        params(
          account_id: String,
          params:
            T.any(
              SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::OrHash,
              SurgeAPI::MessageCreateParams::Params::SimpleMessageParams::OrHash
            ),
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Message)
      end
      def create(
        # The account from which the message should be sent.
        account_id,
        # Payload for creating a message. Either an attachment or the body must be given.
        # You can specify the recipient either using the 'conversation' parameter or the
        # 'to'/'from' parameters, but not both.
        params:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: SurgeAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
