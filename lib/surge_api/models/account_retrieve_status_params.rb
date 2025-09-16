# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Accounts#retrieve_status
    class AccountRetrieveStatusParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute capabilities
      #
      #   @return [Array<Symbol, SurgeAPI::Models::AccountRetrieveStatusParams::Capability>, nil]
      optional :capabilities,
               -> { SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::AccountRetrieveStatusParams::Capability] }

      # @!method initialize(capabilities: nil, request_options: {})
      #   @param capabilities [Array<Symbol, SurgeAPI::Models::AccountRetrieveStatusParams::Capability>]
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]

      module Capability
        extend SurgeAPI::Internal::Type::Enum

        LOCAL_MESSAGING = :local_messaging

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
