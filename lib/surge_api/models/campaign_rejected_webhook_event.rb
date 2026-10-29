# frozen_string_literal: true

module SurgeAPI
  module Models
    class CampaignRejectedWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [SurgeAPI::Models::CampaignRejectedWebhookEvent::Data]
      required :data, -> { SurgeAPI::CampaignRejectedWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `campaign.rejected` for this event.
      #
      #   @return [Symbol, :"campaign.rejected"]
      required :type, const: :"campaign.rejected"

      # @!method initialize(account_id:, data:, timestamp:, type: :"campaign.rejected")
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [SurgeAPI::Models::CampaignRejectedWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, :"campaign.rejected"] The type of the event. Always `campaign.rejected` for this event.

      # @see SurgeAPI::Models::CampaignRejectedWebhookEvent#data
      class Data < SurgeAPI::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the campaign
        #
        #   @return [String]
        required :id, String

        # @!attribute feedback
        #   Customer-visible field-level registration feedback. Rejection events may include
        #   non-blocking warnings alongside changes-needed items.
        #
        #   @return [Array<SurgeAPI::Models::CampaignRejectedWebhookEvent::Data::Feedback>]
        required :feedback,
                 -> { SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::CampaignRejectedWebhookEvent::Data::Feedback] }

        # @!attribute status
        #   The public campaign status. Always `rejected` for this event.
        #
        #   @return [Symbol, SurgeAPI::Models::CampaignRejectedWebhookEvent::Data::Status]
        required :status, enum: -> { SurgeAPI::CampaignRejectedWebhookEvent::Data::Status }

        # @!method initialize(id:, feedback:, status:)
        #   Some parameter documentations has been truncated, see
        #   {SurgeAPI::Models::CampaignRejectedWebhookEvent::Data} for more details.
        #
        #   The data associated with the event
        #
        #   @param id [String] The unique identifier for the campaign
        #
        #   @param feedback [Array<SurgeAPI::Models::CampaignRejectedWebhookEvent::Data::Feedback>] Customer-visible field-level registration feedback. Rejection events may include
        #
        #   @param status [Symbol, SurgeAPI::Models::CampaignRejectedWebhookEvent::Data::Status] The public campaign status. Always `rejected` for this event.

        class Feedback < SurgeAPI::Internal::Type::BaseModel
          # @!attribute field
          #   The stable registration field key
          #
          #   @return [String]
          required :field, String

          # @!attribute message
          #   Actionable review feedback
          #
          #   @return [String]
          required :message, String

          # @!attribute outcome
          #   Whether the feedback blocks registration or is a non-blocking warning
          #
          #   @return [Symbol, SurgeAPI::Models::CampaignRejectedWebhookEvent::Data::Feedback::Outcome]
          required :outcome, enum: -> { SurgeAPI::CampaignRejectedWebhookEvent::Data::Feedback::Outcome }

          # @!attribute suggested_value
          #   A suggested replacement value, or null when none is suggested
          #
          #   @return [String, nil]
          required :suggested_value, String, nil?: true

          # @!method initialize(field:, message:, outcome:, suggested_value:)
          #   @param field [String] The stable registration field key
          #
          #   @param message [String] Actionable review feedback
          #
          #   @param outcome [Symbol, SurgeAPI::Models::CampaignRejectedWebhookEvent::Data::Feedback::Outcome] Whether the feedback blocks registration or is a non-blocking warning
          #
          #   @param suggested_value [String, nil] A suggested replacement value, or null when none is suggested

          # Whether the feedback blocks registration or is a non-blocking warning
          #
          # @see SurgeAPI::Models::CampaignRejectedWebhookEvent::Data::Feedback#outcome
          module Outcome
            extend SurgeAPI::Internal::Type::Enum

            CHANGES_NEEDED = :changes_needed
            WARNING = :warning

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # The public campaign status. Always `rejected` for this event.
        #
        # @see SurgeAPI::Models::CampaignRejectedWebhookEvent::Data#status
        module Status
          extend SurgeAPI::Internal::Type::Enum

          REJECTED = :rejected

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
