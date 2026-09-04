# frozen_string_literal: true

module SurgeAPI
  module Models
    class PhoneNumberImportedWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [SurgeAPI::Models::PhoneNumberImportedWebhookEvent::Data]
      required :data, -> { SurgeAPI::PhoneNumberImportedWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `phone_number.imported` for this event.
      #
      #   @return [Symbol, :"phone_number.imported"]
      required :type, const: :"phone_number.imported"

      # @!method initialize(account_id:, data:, timestamp:, type: :"phone_number.imported")
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [SurgeAPI::Models::PhoneNumberImportedWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, :"phone_number.imported"] The type of the event. Always `phone_number.imported` for this event.

      # @see SurgeAPI::Models::PhoneNumberImportedWebhookEvent#data
      class Data < SurgeAPI::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the phone number
        #
        #   @return [String]
        required :id, String

        # @!attribute campaign
        #   Campaign attachment details for a domestic local phone number
        #
        #   @return [SurgeAPI::Models::PhoneNumberImportedWebhookEvent::Data::Campaign, nil]
        required :campaign, -> { SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign }, nil?: true

        # @!attribute campaign_id
        #   @deprecated Use `campaign.id` instead.
        #
        #   Deprecated. The unique identifier of the campaign this phone number is attached
        #   to
        #
        #   @return [String, nil]
        required :campaign_id, String, nil?: true

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
        #   @return [Symbol, SurgeAPI::Models::PhoneNumberImportedWebhookEvent::Data::Type]
        required :type, enum: -> { SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Type }

        # @!method initialize(id:, campaign:, campaign_id:, name:, number:, type:)
        #   Some parameter documentations has been truncated, see
        #   {SurgeAPI::Models::PhoneNumberImportedWebhookEvent::Data} for more details.
        #
        #   The data associated with the event
        #
        #   @param id [String] The unique identifier for the phone number
        #
        #   @param campaign [SurgeAPI::Models::PhoneNumberImportedWebhookEvent::Data::Campaign, nil] Campaign attachment details for a domestic local phone number
        #
        #   @param campaign_id [String, nil] Deprecated. The unique identifier of the campaign this phone number is attached
        #
        #   @param name [String, nil] A human-readable name for the phone number
        #
        #   @param number [String] The phone number in E.164 format
        #
        #   @param type [Symbol, SurgeAPI::Models::PhoneNumberImportedWebhookEvent::Data::Type] Whether the phone number is local, toll-free, or short code

        # @see SurgeAPI::Models::PhoneNumberImportedWebhookEvent::Data#campaign
        class Campaign < SurgeAPI::Internal::Type::BaseModel
          # @!attribute id
          #   The unique identifier of the campaign this phone number is attached to
          #
          #   @return [String]
          required :id, String

          # @!attribute attachment_status
          #   The current campaign attachment status for this phone number.
          #
          #   @return [Symbol, SurgeAPI::Models::PhoneNumberImportedWebhookEvent::Data::Campaign::AttachmentStatus]
          required :attachment_status,
                   enum: -> { SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign::AttachmentStatus }

          # @!method initialize(id:, attachment_status:)
          #   Campaign attachment details for a domestic local phone number
          #
          #   @param id [String] The unique identifier of the campaign this phone number is attached to
          #
          #   @param attachment_status [Symbol, SurgeAPI::Models::PhoneNumberImportedWebhookEvent::Data::Campaign::AttachmentStatus] The current campaign attachment status for this phone number.

          # The current campaign attachment status for this phone number.
          #
          # @see SurgeAPI::Models::PhoneNumberImportedWebhookEvent::Data::Campaign#attachment_status
          module AttachmentStatus
            extend SurgeAPI::Internal::Type::Enum

            ATTACHED = :attached
            ATTACHMENT_PENDING = :attachment_pending
            DETACHED = :detached
            DETACHMENT_PENDING = :detachment_pending

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # Whether the phone number is local, toll-free, or short code
        #
        # @see SurgeAPI::Models::PhoneNumberImportedWebhookEvent::Data#type
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
