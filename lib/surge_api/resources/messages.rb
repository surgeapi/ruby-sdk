# frozen_string_literal: true

module SurgeAPI
  module Resources
    class Messages
      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::MessageCreateParams} for more details.
      #
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
      #
      # @overload create(account_id, message_params:, request_options: {})
      #
      # @param account_id [String] The account from which the message should be sent.
      #
      # @param message_params [SurgeAPI::MessageParams] Payload for creating a message. Either an attachment or the body must be given.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::Message]
      #
      # @see SurgeAPI::Models::MessageCreateParams
      def create(account_id, params)
        parsed, options = SurgeAPI::MessageCreateParams.dump_request(params)
        case parsed
        in {message_params: Hash => union, **rest}
          parsed = {**rest, **union}
        else
        end
        @client.request(
          method: :post,
          path: ["accounts/%1$s/messages", account_id],
          body: parsed,
          model: SurgeAPI::Message,
          options: options
        )
      end

      # @api private
      #
      # @param client [SurgeAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
