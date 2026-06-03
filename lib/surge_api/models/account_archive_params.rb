# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Accounts#archive
    class AccountArchiveParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute id
      #   The ID of the account to archive.
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:, request_options: {})
      #   @param id [String] The ID of the account to archive.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
