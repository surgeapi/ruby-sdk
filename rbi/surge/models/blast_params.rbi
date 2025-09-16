# typed: strong

module Surge
  module Models
    class BlastParams < Surge::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Surge::BlastParams, Surge::Internal::AnyHash) }

      sig { returns(T.nilable(T::Array[Surge::AttachmentParams])) }
      attr_reader :attachments

      sig do
        params(attachments: T::Array[Surge::AttachmentParams::OrHash]).void
      end
      attr_writer :attachments

      # The message body.
      sig { returns(T.nilable(String)) }
      attr_reader :body

      sig { params(body: String).void }
      attr_writer :body

      # Deprecated. Use `to` instead.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :contacts

      sig { params(contacts: T::Array[String]).void }
      attr_writer :contacts

      # Optional name for the blast.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Deprecated. Use `to` instead.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :segments

      sig { params(segments: T::Array[String]).void }
      attr_writer :segments

      # When to send the blast. If not provided, sends immediately.
      sig { returns(T.nilable(Time)) }
      attr_reader :send_at

      sig { params(send_at: Time).void }
      attr_writer :send_at

      # List of recipients to whom the blast should be sent. This can be a combination
      # of contact IDs, segment IDs, and phone numbers.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :to

      sig { params(to: T::Array[String]).void }
      attr_writer :to

      # Parameters for creating a Blast
      sig do
        params(
          attachments: T::Array[Surge::AttachmentParams::OrHash],
          body: String,
          contacts: T::Array[String],
          name: String,
          segments: T::Array[String],
          send_at: Time,
          to: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(
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
        to: nil
      )
      end

      sig do
        override.returns(
          {
            attachments: T::Array[Surge::AttachmentParams],
            body: String,
            contacts: T::Array[String],
            name: String,
            segments: T::Array[String],
            send_at: Time,
            to: T::Array[String]
          }
        )
      end
      def to_hash
      end
    end
  end
end
