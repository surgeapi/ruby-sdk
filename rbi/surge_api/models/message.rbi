# typed: strong

module SurgeAPI
  module Models
    class Message < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(SurgeAPI::Message, SurgeAPI::Internal::AnyHash) }

      # Unique identifier for the object.
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      sig { returns(T.nilable(T::Array[SurgeAPI::Message::Attachment])) }
      attr_reader :attachments

      sig do
        params(
          attachments: T::Array[SurgeAPI::Message::Attachment::OrHash]
        ).void
      end
      attr_writer :attachments

      # The message body.
      sig { returns(T.nilable(String)) }
      attr_reader :body

      sig { params(body: String).void }
      attr_writer :body

      # A conversation with a Contact
      sig { returns(T.nilable(SurgeAPI::Message::Conversation)) }
      attr_reader :conversation

      sig { params(conversation: SurgeAPI::Message::Conversation::OrHash).void }
      attr_writer :conversation

      # Set of key-value pairs that will be stored with the object.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # A Message is a communication sent to a Contact.
      sig do
        params(
          id: String,
          attachments: T::Array[SurgeAPI::Message::Attachment::OrHash],
          body: String,
          conversation: SurgeAPI::Message::Conversation::OrHash,
          metadata: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the object.
        id: nil,
        attachments: nil,
        # The message body.
        body: nil,
        # A conversation with a Contact
        conversation: nil,
        # Set of key-value pairs that will be stored with the object.
        metadata: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            attachments: T::Array[SurgeAPI::Message::Attachment],
            body: String,
            conversation: SurgeAPI::Message::Conversation,
            metadata: T::Hash[Symbol, String]
          }
        )
      end
      def to_hash
      end

      class Attachment < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(SurgeAPI::Message::Attachment, SurgeAPI::Internal::AnyHash)
          end

        # Unique identifier for the object.
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # The type of attachment.
        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        # The URL of the attachment.
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # An Attachment is a file that can be sent with a message.
        sig do
          params(id: String, type: String, url: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Unique identifier for the object.
          id: nil,
          # The type of attachment.
          type: nil,
          # The URL of the attachment.
          url: nil
        )
        end

        sig { override.returns({ id: String, type: String, url: String }) }
        def to_hash
        end
      end

      class Conversation < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(SurgeAPI::Message::Conversation, SurgeAPI::Internal::AnyHash)
          end

        # Unique identifier for the object.
        sig { returns(String) }
        attr_accessor :id

        # A contact who has consented to receive messages
        sig { returns(SurgeAPI::Contact) }
        attr_reader :contact

        sig { params(contact: SurgeAPI::Contact::OrHash).void }
        attr_writer :contact

        # This is the phone number tied to the Surge account.
        sig { returns(T.nilable(SurgeAPI::Message::Conversation::PhoneNumber)) }
        attr_reader :phone_number

        sig do
          params(
            phone_number: SurgeAPI::Message::Conversation::PhoneNumber::OrHash
          ).void
        end
        attr_writer :phone_number

        # A conversation with a Contact
        sig do
          params(
            id: String,
            contact: SurgeAPI::Contact::OrHash,
            phone_number: SurgeAPI::Message::Conversation::PhoneNumber::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for the object.
          id:,
          # A contact who has consented to receive messages
          contact:,
          # This is the phone number tied to the Surge account.
          phone_number: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              contact: SurgeAPI::Contact,
              phone_number: SurgeAPI::Message::Conversation::PhoneNumber
            }
          )
        end
        def to_hash
        end

        class PhoneNumber < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::Message::Conversation::PhoneNumber,
                SurgeAPI::Internal::AnyHash
              )
            end

          # Unique identifier for the phone number
          sig { returns(String) }
          attr_accessor :id

          # The canonical format of the phone number.
          sig { returns(String) }
          attr_accessor :number

          # Whether the phone number is local, toll-free, or short code
          sig do
            returns(
              SurgeAPI::Message::Conversation::PhoneNumber::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # This is the phone number tied to the Surge account.
          sig do
            params(
              id: String,
              number: String,
              type: SurgeAPI::Message::Conversation::PhoneNumber::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for the phone number
            id:,
            # The canonical format of the phone number.
            number:,
            # Whether the phone number is local, toll-free, or short code
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                number: String,
                type:
                  SurgeAPI::Message::Conversation::PhoneNumber::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # Whether the phone number is local, toll-free, or short code
          module Type
            extend SurgeAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  SurgeAPI::Message::Conversation::PhoneNumber::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            LOCAL =
              T.let(
                :local,
                SurgeAPI::Message::Conversation::PhoneNumber::Type::TaggedSymbol
              )
            TOLL_FREE =
              T.let(
                :toll_free,
                SurgeAPI::Message::Conversation::PhoneNumber::Type::TaggedSymbol
              )
            SHORT_CODE =
              T.let(
                :short_code,
                SurgeAPI::Message::Conversation::PhoneNumber::Type::TaggedSymbol
              )
            DEMO =
              T.let(
                :demo,
                SurgeAPI::Message::Conversation::PhoneNumber::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::Message::Conversation::PhoneNumber::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
