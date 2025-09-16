# typed: strong

module Surge
  module Models
    class ConversationCreatedWebhookEvent < Surge::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Surge::ConversationCreatedWebhookEvent,
            Surge::Internal::AnyHash
          )
        end

      # The ID of the account in which this event occurred
      sig { returns(String) }
      attr_accessor :account_id

      # The data associated with the event
      sig { returns(Surge::ConversationCreatedWebhookEvent::Data) }
      attr_reader :data

      sig do
        params(data: Surge::ConversationCreatedWebhookEvent::Data::OrHash).void
      end
      attr_writer :data

      # The timestamp when this event occurred, in ISO8601 format
      sig { returns(Time) }
      attr_accessor :timestamp

      # The type of the event. Always `conversation.created` for this event.
      sig do
        returns(Surge::ConversationCreatedWebhookEvent::Type::TaggedSymbol)
      end
      attr_accessor :type

      # The `conversation.created` event is delivered whenever a new conversation is
      # started with a contact. This could be when either the contact sends a message to
      # your Surge number or when you create a conversation, whether by sending an
      # initial message to the contact or by manually creating the conversation using
      # the API.
      sig do
        params(
          account_id: String,
          data: Surge::ConversationCreatedWebhookEvent::Data::OrHash,
          timestamp: Time,
          type: Surge::ConversationCreatedWebhookEvent::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the account in which this event occurred
        account_id:,
        # The data associated with the event
        data:,
        # The timestamp when this event occurred, in ISO8601 format
        timestamp:,
        # The type of the event. Always `conversation.created` for this event.
        type:
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            data: Surge::ConversationCreatedWebhookEvent::Data,
            timestamp: Time,
            type: Surge::ConversationCreatedWebhookEvent::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Data < Surge::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Surge::ConversationCreatedWebhookEvent::Data,
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

        # The data associated with the event
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

      # The type of the event. Always `conversation.created` for this event.
      module Type
        extend Surge::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Surge::ConversationCreatedWebhookEvent::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CONVERSATION_CREATED =
          T.let(
            :"conversation.created",
            Surge::ConversationCreatedWebhookEvent::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Surge::ConversationCreatedWebhookEvent::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
