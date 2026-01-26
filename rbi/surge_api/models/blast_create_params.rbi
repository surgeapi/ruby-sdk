# typed: strong

module SurgeAPI
  module Models
    class BlastCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::BlastCreateParams, SurgeAPI::Internal::AnyHash)
        end

      sig do
        returns(T.nilable(T::Array[SurgeAPI::BlastCreateParams::Attachment]))
      end
      attr_reader :attachments

      sig do
        params(
          attachments: T::Array[SurgeAPI::BlastCreateParams::Attachment::OrHash]
        ).void
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

      # The phone number from which to send the blast. This can be either the phone
      # number in E.164 format or a Surge phone number id. If not provided, the
      # account's default phone number is used.
      sig { returns(T.nilable(String)) }
      attr_reader :from

      sig { params(from: String).void }
      attr_writer :from

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

      sig do
        params(
          attachments:
            T::Array[SurgeAPI::BlastCreateParams::Attachment::OrHash],
          body: String,
          contacts: T::Array[String],
          from: String,
          name: String,
          segments: T::Array[String],
          send_at: Time,
          to: T::Array[String],
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        attachments: nil,
        # The message body.
        body: nil,
        # Deprecated. Use `to` instead.
        contacts: nil,
        # The phone number from which to send the blast. This can be either the phone
        # number in E.164 format or a Surge phone number id. If not provided, the
        # account's default phone number is used.
        from: nil,
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

      sig do
        override.returns(
          {
            attachments: T::Array[SurgeAPI::BlastCreateParams::Attachment],
            body: String,
            contacts: T::Array[String],
            from: String,
            name: String,
            segments: T::Array[String],
            send_at: Time,
            to: T::Array[String],
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Attachment < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::BlastCreateParams::Attachment,
              SurgeAPI::Internal::AnyHash
            )
          end

        # The URL of the attachment.
        sig { returns(String) }
        attr_accessor :url

        # Params for creating an attachment
        sig { params(url: String).returns(T.attached_class) }
        def self.new(
          # The URL of the attachment.
          url:
        )
        end

        sig { override.returns({ url: String }) }
        def to_hash
        end
      end
    end
  end
end
