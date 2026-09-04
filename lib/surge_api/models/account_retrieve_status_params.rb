# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Accounts#retrieve_status
    class AccountRetrieveStatusParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute account_id
      #   ID of the account to check
      #
      #   @return [String]
      required :account_id, String

      # @!attribute capabilities
      #   capabilities about which to check the status
      #
      #   @return [Array<Symbol, SurgeAPI::Models::AccountRetrieveStatusParams::Capability>, nil]
      optional :capabilities,
               -> { SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::AccountRetrieveStatusParams::Capability] }

      # @!method initialize(account_id:, capabilities: nil, request_options: {})
      #   @param account_id [String] ID of the account to check
      #
      #   @param capabilities [Array<Symbol, SurgeAPI::Models::AccountRetrieveStatusParams::Capability>] capabilities about which to check the status
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]

      module Capability
        extend SurgeAPI::Internal::Type::Enum

        LOCAL_MESSAGING = :local_messaging
        TOLL_FREE_MESSAGING = :toll_free_messaging

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
