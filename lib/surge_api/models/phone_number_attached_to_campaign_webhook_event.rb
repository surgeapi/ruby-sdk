# frozen_string_literal: true

module SurgeAPI
  module Models
    class PhoneNumberAttachedToCampaignWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [SurgeAPI::Models::PhoneNumberAttachedToCampaignWebhookEvent::Data]
      required :data, -> { SurgeAPI::PhoneNumberAttachedToCampaignWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `phone_number.attached_to_campaign` for this
      #   event.
      #
      #   @return [Symbol, :"phone_number.attached_to_campaign"]
      required :type, const: :"phone_number.attached_to_campaign"

      # @!method initialize(account_id:, data:, timestamp:, type: :"phone_number.attached_to_campaign")
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::PhoneNumberAttachedToCampaignWebhookEvent} for more details.
      #
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [SurgeAPI::Models::PhoneNumberAttachedToCampaignWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, :"phone_number.attached_to_campaign"] The type of the event. Always `phone_number.attached_to_campaign` for this event

      # @see SurgeAPI::Models::PhoneNumberAttachedToCampaignWebhookEvent#data
      class Data < SurgeAPI::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the phone number
        #
        #   @return [String]
        required :id, String

        # @!attribute campaign_id
        #   The unique identifier of the campaign this phone number is attached to
        #
        #   @return [String]
        required :campaign_id, String

        # @!attribute name
        #   A human-readable name for the phone number
        #
        #   @return [String, nil]
        required :name, String, nil?: true

        # @!attribute number
        #   The phone number in E.164 format
        #
        #   @return [String]
        required :number, String

        # @!attribute type
        #   Whether the phone number is local, toll-free, or short code
        #
        #   @return [Symbol, SurgeAPI::Models::PhoneNumberAttachedToCampaignWebhookEvent::Data::Type]
        required :type, enum: -> { SurgeAPI::PhoneNumberAttachedToCampaignWebhookEvent::Data::Type }

        # @!method initialize(id:, campaign_id:, name:, number:, type:)
        #   The data associated with the event
        #
        #   @param id [String] The unique identifier for the phone number
        #
        #   @param campaign_id [String] The unique identifier of the campaign this phone number is attached to
        #
        #   @param name [String, nil] A human-readable name for the phone number
        #
        #   @param number [String] The phone number in E.164 format
        #
        #   @param type [Symbol, SurgeAPI::Models::PhoneNumberAttachedToCampaignWebhookEvent::Data::Type] Whether the phone number is local, toll-free, or short code

        # Whether the phone number is local, toll-free, or short code
        #
        # @see SurgeAPI::Models::PhoneNumberAttachedToCampaignWebhookEvent::Data#type
        module Type
          extend SurgeAPI::Internal::Type::Enum

          LOCAL = :local
          SHORT_CODE = :short_code
          TOLL_FREE = :toll_free

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
