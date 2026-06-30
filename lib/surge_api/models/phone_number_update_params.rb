# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::PhoneNumbers#update
    class PhoneNumberUpdateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute id
      #   The ID of the phone number to update.
      #
      #   @return [String]
      required :id, String

      # @!attribute campaign_id
      #   Campaign ID to attach this number to (`cpn_...`).
      #
      #   @return [String, nil]
      optional :campaign_id, String

      # @!attribute name
      #   A human-readable name for the phone number.
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(id:, campaign_id: nil, name: nil, request_options: {})
      #   @param id [String] The ID of the phone number to update.
      #
      #   @param campaign_id [String] Campaign ID to attach this number to (`cpn_...`).
      #
      #   @param name [String] A human-readable name for the phone number.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
