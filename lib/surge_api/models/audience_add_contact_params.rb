# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Audiences#add_contact
    class AudienceAddContactParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute id
      #   The ID of the contact to add. The contact must belong to the same account as the
      #   audience.
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::AudienceAddContactParams} for more details.
      #
      #   @param id [String] The ID of the contact to add. The contact must belong to the same account as the
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
