# typed: strong

module SurgeAPI
  module Models
    class ContactOptedInWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::ContactOptedInWebhookEvent,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The ID of the account in which this event occurred
      sig { returns(String) }
      attr_accessor :account_id

      # The data associated with the event
      sig { returns(SurgeAPI::ContactOptedInWebhookEvent::Data) }
      attr_reader :data

      sig do
        params(data: SurgeAPI::ContactOptedInWebhookEvent::Data::OrHash).void
      end
      attr_writer :data

      # The timestamp when this event occurred, in ISO8601 format
      sig { returns(Time) }
      attr_accessor :timestamp

      # The type of the event. Always `contact.opted_in` for this event.
      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          account_id: String,
          data: SurgeAPI::ContactOptedInWebhookEvent::Data::OrHash,
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
        # The type of the event. Always `contact.opted_in` for this event.
        type: :"contact.opted_in"
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            data: SurgeAPI::ContactOptedInWebhookEvent::Data,
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
              SurgeAPI::ContactOptedInWebhookEvent::Data,
              SurgeAPI::Internal::AnyHash
            )
          end

        # The unique identifier for the contact
        sig { returns(String) }
        attr_accessor :id

        # The data associated with the event
        sig { params(id: String).returns(T.attached_class) }
        def self.new(
          # The unique identifier for the contact
          id:
        )
        end

        sig { override.returns({ id: String }) }
        def to_hash
        end
      end
    end
  end
end
