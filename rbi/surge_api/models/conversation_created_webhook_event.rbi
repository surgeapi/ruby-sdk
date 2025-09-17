# typed: strong

module SurgeAPI
  module Models
    class ConversationCreatedWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::ConversationCreatedWebhookEvent,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The ID of the account in which this event occurred
      sig { returns(String) }
      attr_accessor :account_id

      # The data associated with the event
      sig { returns(SurgeAPI::ConversationCreatedWebhookEvent::Data) }
      attr_reader :data

      sig do
        params(
          data: SurgeAPI::ConversationCreatedWebhookEvent::Data::OrHash
        ).void
      end
      attr_writer :data

      # The timestamp when this event occurred, in ISO8601 format
      sig { returns(Time) }
      attr_accessor :timestamp

      # The type of the event. Always `conversation.created` for this event.
      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          account_id: String,
          data: SurgeAPI::ConversationCreatedWebhookEvent::Data::OrHash,
          timestamp: Time,
          type: Symbol
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
        type: :"conversation.created"
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            data: SurgeAPI::ConversationCreatedWebhookEvent::Data,
            timestamp: Time,
            type: Symbol
          }
        )
      end
      def to_hash
      end

      class Data < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::ConversationCreatedWebhookEvent::Data,
              SurgeAPI::Internal::AnyHash
            )
          end

        # The unique identifier for the conversation
        sig { returns(String) }
        attr_accessor :id

        # A contact who has consented to receive messages
        sig { returns(SurgeAPI::Contact) }
        attr_reader :contact

        sig { params(contact: SurgeAPI::Contact::OrHash).void }
        attr_writer :contact

        # A phone number that can be used to send and receive messages and calls
        sig { returns(SurgeAPI::PhoneNumber) }
        attr_reader :phone_number

        sig { params(phone_number: SurgeAPI::PhoneNumber::OrHash).void }
        attr_writer :phone_number

        # The data associated with the event
        sig do
          params(
            id: String,
            contact: SurgeAPI::Contact::OrHash,
            phone_number: SurgeAPI::PhoneNumber::OrHash
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
              contact: SurgeAPI::Contact,
              phone_number: SurgeAPI::PhoneNumber
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
