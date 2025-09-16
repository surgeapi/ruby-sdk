# typed: strong

module Surge
  module Models
    class MessageFailedWebhookEvent < Surge::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Surge::MessageFailedWebhookEvent, Surge::Internal::AnyHash)
        end

      # The ID of the account in which this event occurred
      sig { returns(String) }
      attr_accessor :account_id

      # The data associated with the event
      sig { returns(Surge::MessageFailedWebhookEvent::Data) }
      attr_reader :data

      sig { params(data: Surge::MessageFailedWebhookEvent::Data::OrHash).void }
      attr_writer :data

      # The timestamp when this event occurred, in ISO8601 format
      sig { returns(Time) }
      attr_accessor :timestamp

      # The type of the event. Always `message.failed` for this event.
      sig { returns(Surge::MessageFailedWebhookEvent::Type::TaggedSymbol) }
      attr_accessor :type

      # The `message.failed` event is delivered whenever a message sent from your Surge
      # number fails to be delivered.
      sig do
        params(
          account_id: String,
          data: Surge::MessageFailedWebhookEvent::Data::OrHash,
          timestamp: Time,
          type: Surge::MessageFailedWebhookEvent::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the account in which this event occurred
        account_id:,
        # The data associated with the event
        data:,
        # The timestamp when this event occurred, in ISO8601 format
        timestamp:,
        # The type of the event. Always `message.failed` for this event.
        type:
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            data: Surge::MessageFailedWebhookEvent::Data,
            timestamp: Time,
            type: Surge::MessageFailedWebhookEvent::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Data < Surge::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Surge::MessageFailedWebhookEvent::Data,
              Surge::Internal::AnyHash
            )
          end

        # The unique identifier for the message
        sig { returns(String) }
        attr_accessor :id

        # The content of the message
        sig { returns(String) }
        attr_accessor :body

        # The conversation this message belongs to
        sig { returns(Surge::MessageFailedWebhookEvent::Data::Conversation) }
        attr_reader :conversation

        sig do
          params(
            conversation:
              Surge::MessageFailedWebhookEvent::Data::Conversation::OrHash
          ).void
        end
        attr_writer :conversation

        # When the message failed
        sig { returns(Time) }
        attr_accessor :failed_at

        # The reason the message failed to be delivered
        sig { returns(String) }
        attr_accessor :failure_reason

        # Attachments included with the message
        sig do
          returns(
            T.nilable(
              T::Array[Surge::MessageFailedWebhookEvent::Data::Attachment]
            )
          )
        end
        attr_reader :attachments

        sig do
          params(
            attachments:
              T::Array[
                Surge::MessageFailedWebhookEvent::Data::Attachment::OrHash
              ]
          ).void
        end
        attr_writer :attachments

        # The data associated with the event
        sig do
          params(
            id: String,
            body: String,
            conversation:
              Surge::MessageFailedWebhookEvent::Data::Conversation::OrHash,
            failed_at: Time,
            failure_reason: String,
            attachments:
              T::Array[
                Surge::MessageFailedWebhookEvent::Data::Attachment::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # The unique identifier for the message
          id:,
          # The content of the message
          body:,
          # The conversation this message belongs to
          conversation:,
          # When the message failed
          failed_at:,
          # The reason the message failed to be delivered
          failure_reason:,
          # Attachments included with the message
          attachments: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              body: String,
              conversation:
                Surge::MessageFailedWebhookEvent::Data::Conversation,
              failed_at: Time,
              failure_reason: String,
              attachments:
                T::Array[Surge::MessageFailedWebhookEvent::Data::Attachment]
            }
          )
        end
        def to_hash
        end

        class Conversation < Surge::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Surge::MessageFailedWebhookEvent::Data::Conversation,
                Surge::Internal::AnyHash
              )
            end

          # The unique identifier for the conversation
          sig { returns(String) }
          attr_accessor :id

          # A contact who has consented to receive messages
          sig { returns(Surge::Contact) }
          attr_reader :contact

          sig { params(contact: Surge::Contact::OrHash).void }
          attr_writer :contact

          # A phone number that can be used to send and receive messages and calls
          sig { returns(Surge::PhoneNumber) }
          attr_reader :phone_number

          sig { params(phone_number: Surge::PhoneNumber::OrHash).void }
          attr_writer :phone_number

          # The conversation this message belongs to
          sig do
            params(
              id: String,
              contact: Surge::Contact::OrHash,
              phone_number: Surge::PhoneNumber::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The unique identifier for the conversation
            id:,
            # A contact who has consented to receive messages
            contact:,
            # A phone number that can be used to send and receive messages and calls
            phone_number:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                contact: Surge::Contact,
                phone_number: Surge::PhoneNumber
              }
            )
          end
          def to_hash
          end
        end

        class Attachment < Surge::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Surge::MessageFailedWebhookEvent::Data::Attachment,
                Surge::Internal::AnyHash
              )
            end

          # The unique identifier for the attachment
          sig { returns(String) }
          attr_accessor :id

          # The type of attachment
          sig do
            returns(
              Surge::MessageFailedWebhookEvent::Data::Attachment::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The URL to download the attachment
          sig { returns(String) }
          attr_accessor :url

          sig do
            params(
              id: String,
              type:
                Surge::MessageFailedWebhookEvent::Data::Attachment::Type::OrSymbol,
              url: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The unique identifier for the attachment
            id:,
            # The type of attachment
            type:,
            # The URL to download the attachment
            url:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                type:
                  Surge::MessageFailedWebhookEvent::Data::Attachment::Type::TaggedSymbol,
                url: String
              }
            )
          end
          def to_hash
          end

          # The type of attachment
          module Type
            extend Surge::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Surge::MessageFailedWebhookEvent::Data::Attachment::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FILE =
              T.let(
                :file,
                Surge::MessageFailedWebhookEvent::Data::Attachment::Type::TaggedSymbol
              )
            IMAGE =
              T.let(
                :image,
                Surge::MessageFailedWebhookEvent::Data::Attachment::Type::TaggedSymbol
              )
            LINK =
              T.let(
                :link,
                Surge::MessageFailedWebhookEvent::Data::Attachment::Type::TaggedSymbol
              )
            VIDEO =
              T.let(
                :video,
                Surge::MessageFailedWebhookEvent::Data::Attachment::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Surge::MessageFailedWebhookEvent::Data::Attachment::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      # The type of the event. Always `message.failed` for this event.
      module Type
        extend Surge::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Surge::MessageFailedWebhookEvent::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MESSAGE_FAILED =
          T.let(
            :"message.failed",
            Surge::MessageFailedWebhookEvent::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Surge::MessageFailedWebhookEvent::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
