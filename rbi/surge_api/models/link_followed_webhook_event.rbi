# typed: strong

module SurgeAPI
  module Models
    class LinkFollowedWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SurgeAPI::LinkFollowedWebhookEvent, SurgeAPI::Internal::AnyHash)
        end

      # The ID of the account in which this event occurred
      sig { returns(String) }
      attr_accessor :account_id

      # The data associated with the event
      sig { returns(SurgeAPI::LinkFollowedWebhookEvent::Data) }
      attr_reader :data

      sig do
        params(data: SurgeAPI::LinkFollowedWebhookEvent::Data::OrHash).void
      end
      attr_writer :data

      # The timestamp when this event occurred, in ISO8601 format
      sig { returns(Time) }
      attr_accessor :timestamp

      # The type of the event. Always `link.followed` for this event.
      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          account_id: String,
          data: SurgeAPI::LinkFollowedWebhookEvent::Data::OrHash,
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
        # The type of the event. Always `link.followed` for this event.
        type: :"link.followed"
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            data: SurgeAPI::LinkFollowedWebhookEvent::Data,
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
              SurgeAPI::LinkFollowedWebhookEvent::Data,
              SurgeAPI::Internal::AnyHash
            )
          end

        # The unique identifier for the link
        sig { returns(String) }
        attr_accessor :id

        # The unique identifier for the message that contained the link
        sig { returns(String) }
        attr_accessor :message_id

        # The original URL that was shortened
        sig { returns(String) }
        attr_accessor :url

        # The data associated with the event
        sig do
          params(id: String, message_id: String, url: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # The unique identifier for the link
          id:,
          # The unique identifier for the message that contained the link
          message_id:,
          # The original URL that was shortened
          url:
        )
        end

        sig do
          override.returns({ id: String, message_id: String, url: String })
        end
        def to_hash
        end
      end
    end
  end
end
