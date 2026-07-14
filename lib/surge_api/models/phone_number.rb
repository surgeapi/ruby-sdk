# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::PhoneNumbers#update
    class PhoneNumber < SurgeAPI::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the phone number
      #
      #   @return [String]
      required :id, String

      # @!attribute campaign
      #   Campaign attachment details for a domestic local phone number
      #
      #   @return [SurgeAPI::Models::PhoneNumber::Campaign, nil]
      required :campaign, -> { SurgeAPI::PhoneNumber::Campaign }, nil?: true

      # @!attribute campaign_id
      #   @deprecated Use `campaign.id` instead.
      #
      #   Deprecated. The unique identifier of the campaign this phone number is attached
      #   to, if any
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
      #   @return [Symbol, SurgeAPI::Models::PhoneNumber::Type]
      required :type, enum: -> { SurgeAPI::PhoneNumber::Type }

      # @!method initialize(id:, campaign:, campaign_id:, name:, number:, type:)
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::PhoneNumber} for more details.
      #
      #   A phone number that can be used to send and receive messages and calls
      #
      #   @param id [String] Unique identifier for the phone number
      #
      #   @param campaign [SurgeAPI::Models::PhoneNumber::Campaign, nil] Campaign attachment details for a domestic local phone number
      #
      #   @param campaign_id [String, nil] Deprecated. The unique identifier of the campaign this phone number is attached
      #
      #   @param name [String, nil] A human-readable name for the phone number
      #
      #   @param number [String] The phone number in E.164 format
      #
      #   @param type [Symbol, SurgeAPI::Models::PhoneNumber::Type] Whether the phone number is local, toll-free, or short code

      # @see SurgeAPI::Models::PhoneNumber#campaign
      class Campaign < SurgeAPI::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier of the campaign this phone number is attached to
        #
        #   @return [String]
        required :id, String

        # @!attribute attachment_status
        #   The current campaign attachment status for this phone number.
        #
        #   @return [Symbol, SurgeAPI::Models::PhoneNumber::Campaign::AttachmentStatus]
        required :attachment_status, enum: -> { SurgeAPI::PhoneNumber::Campaign::AttachmentStatus }

        # @!method initialize(id:, attachment_status:)
        #   Campaign attachment details for a domestic local phone number
        #
        #   @param id [String] The unique identifier of the campaign this phone number is attached to
        #
        #   @param attachment_status [Symbol, SurgeAPI::Models::PhoneNumber::Campaign::AttachmentStatus] The current campaign attachment status for this phone number.

        # The current campaign attachment status for this phone number.
        #
        # @see SurgeAPI::Models::PhoneNumber::Campaign#attachment_status
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
      # @see SurgeAPI::Models::PhoneNumber#type
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
