# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Audiences#create
    class AudienceCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The account for which the audience should be created.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute name
      #   The audience name.
      #
      #   @return [String]
      required :name, String

      # @!method initialize(account_id:, name:, request_options: {})
      #   @param account_id [String] The account for which the audience should be created.
      #
      #   @param name [String] The audience name.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
