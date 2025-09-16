# typed: strong

module Surge
  module Resources
    class Blasts
      # Sends a Blast.
      sig do
        params(
          account_id: String,
          attachments: T::Array[Surge::AttachmentParams::OrHash],
          body: String,
          contacts: T::Array[String],
          name: String,
          segments: T::Array[String],
          send_at: Time,
          to: T::Array[String],
          request_options: Surge::RequestOptions::OrHash
        ).returns(Surge::Blast)
      end
      def create(
        # The account for which the blast should be sent.
        account_id,
        attachments: nil,
        # The message body.
        body: nil,
        # Deprecated. Use `to` instead.
        contacts: nil,
        # Optional name for the blast.
        name: nil,
        # Deprecated. Use `to` instead.
        segments: nil,
        # When to send the blast. If not provided, sends immediately.
        send_at: nil,
        # List of recipients to whom the blast should be sent. This can be a combination
        # of contact IDs, segment IDs, and phone numbers.
        to: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Surge::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
