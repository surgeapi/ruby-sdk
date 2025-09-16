# typed: strong

module SurgeAPI
  module Models
    class Blast < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(SurgeAPI::Blast, SurgeAPI::Internal::AnyHash) }

      # Unique identifier for the object.
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      sig { returns(T.nilable(T::Array[SurgeAPI::Blast::Attachment])) }
      attr_reader :attachments

      sig do
        params(attachments: T::Array[SurgeAPI::Blast::Attachment::OrHash]).void
      end
      attr_writer :attachments

      # The message body.
      sig { returns(T.nilable(String)) }
      attr_reader :body

      sig { params(body: String).void }
      attr_writer :body

      # Optional name for the blast.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # When the blast will be or was sent.
      sig { returns(T.nilable(Time)) }
      attr_reader :send_at

      sig { params(send_at: Time).void }
      attr_writer :send_at

      # A Blast is a message sent to multiple recipients at once.
      sig do
        params(
          id: String,
          attachments: T::Array[SurgeAPI::Blast::Attachment::OrHash],
          body: String,
          name: String,
          send_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the object.
        id: nil,
        attachments: nil,
        # The message body.
        body: nil,
        # Optional name for the blast.
        name: nil,
        # When the blast will be or was sent.
        send_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            attachments: T::Array[SurgeAPI::Blast::Attachment],
            body: String,
            name: String,
            send_at: Time
          }
        )
      end
      def to_hash
      end

      class Attachment < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(SurgeAPI::Blast::Attachment, SurgeAPI::Internal::AnyHash)
          end

        # The URL of the attachment.
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        sig { params(url: String).returns(T.attached_class) }
        def self.new(
          # The URL of the attachment.
          url: nil
        )
        end

        sig { override.returns({ url: String }) }
        def to_hash
        end
      end
    end
  end
end
