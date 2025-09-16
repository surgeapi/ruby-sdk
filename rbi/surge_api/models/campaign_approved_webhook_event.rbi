# typed: strong

module SurgeAPI
  module Models
    class CampaignApprovedWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::CampaignApprovedWebhookEvent,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The ID of the account in which this event occurred
      sig { returns(String) }
      attr_accessor :account_id

      # The data associated with the event
      sig { returns(SurgeAPI::CampaignApprovedWebhookEvent::Data) }
      attr_reader :data

      sig do
        params(data: SurgeAPI::CampaignApprovedWebhookEvent::Data::OrHash).void
      end
      attr_writer :data

      # The timestamp when this event occurred, in ISO8601 format
      sig { returns(Time) }
      attr_accessor :timestamp

      # The type of the event. Always `campaign.approved` for this event.
      sig do
        returns(SurgeAPI::CampaignApprovedWebhookEvent::Type::TaggedSymbol)
      end
      attr_accessor :type

      # The `campaign.approved` event is delivered whenever a campaign is approved by
      # all of the US carriers and able to start sending text messages.
      sig do
        params(
          account_id: String,
          data: SurgeAPI::CampaignApprovedWebhookEvent::Data::OrHash,
          timestamp: Time,
          type: SurgeAPI::CampaignApprovedWebhookEvent::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the account in which this event occurred
        account_id:,
        # The data associated with the event
        data:,
        # The timestamp when this event occurred, in ISO8601 format
        timestamp:,
        # The type of the event. Always `campaign.approved` for this event.
        type:
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            data: SurgeAPI::CampaignApprovedWebhookEvent::Data,
            timestamp: Time,
            type: SurgeAPI::CampaignApprovedWebhookEvent::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Data < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::CampaignApprovedWebhookEvent::Data,
              SurgeAPI::Internal::AnyHash
            )
          end

        # The unique identifier for the campaign
        sig { returns(String) }
        attr_accessor :id

        # The status of the campaign. Will always be `active` for this event.
        sig do
          returns(
            SurgeAPI::CampaignApprovedWebhookEvent::Data::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # The data associated with the event
        sig do
          params(
            id: String,
            status:
              SurgeAPI::CampaignApprovedWebhookEvent::Data::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The unique identifier for the campaign
          id:,
          # The status of the campaign. Will always be `active` for this event.
          status:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              status:
                SurgeAPI::CampaignApprovedWebhookEvent::Data::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The status of the campaign. Will always be `active` for this event.
        module Status
          extend SurgeAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                SurgeAPI::CampaignApprovedWebhookEvent::Data::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              SurgeAPI::CampaignApprovedWebhookEvent::Data::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::CampaignApprovedWebhookEvent::Data::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # The type of the event. Always `campaign.approved` for this event.
      module Type
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, SurgeAPI::CampaignApprovedWebhookEvent::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CAMPAIGN_APPROVED =
          T.let(
            :"campaign.approved",
            SurgeAPI::CampaignApprovedWebhookEvent::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[SurgeAPI::CampaignApprovedWebhookEvent::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
