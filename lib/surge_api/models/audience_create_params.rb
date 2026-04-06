# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Audiences#create
    class AudienceCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute name
      #   The audience name.
      #
      #   @return [String]
      required :name, String

      # @!method initialize(name:, request_options: {})
      #   @param name [String] The audience name.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
