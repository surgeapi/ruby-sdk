# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Campaigns#resend_brand_verification_message
    class CampaignResendBrandVerificationMessageResponse < SurgeAPI::Internal::Type::BaseModel
      # @!attribute status
      #   Indicates the OTP send job was enqueued successfully.
      #
      #   @return [Symbol, SurgeAPI::Models::CampaignResendBrandVerificationMessageResponse::Status]
      required :status, enum: -> { SurgeAPI::Models::CampaignResendBrandVerificationMessageResponse::Status }

      # @!method initialize(status:)
      #   Response when a brand verification OTP send has been enqueued
      #
      #   @param status [Symbol, SurgeAPI::Models::CampaignResendBrandVerificationMessageResponse::Status] Indicates the OTP send job was enqueued successfully.

      # Indicates the OTP send job was enqueued successfully.
      #
      # @see SurgeAPI::Models::CampaignResendBrandVerificationMessageResponse#status
      module Status
        extend SurgeAPI::Internal::Type::Enum

        ENQUEUED = :enqueued

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
