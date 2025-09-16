# frozen_string_literal: true

module Surge
  module Models
    # @see Surge::Resources::Accounts#retrieve_status
    class AccountRetrieveStatusParams < Surge::Internal::Type::BaseModel
      extend Surge::Internal::Type::RequestParameters::Converter
      include Surge::Internal::Type::RequestParameters

      # @!attribute capabilities
      #
      #   @return [Array<Symbol, Surge::Models::AccountRetrieveStatusParams::Capability>, nil]
      optional :capabilities,
               -> { Surge::Internal::Type::ArrayOf[enum: Surge::AccountRetrieveStatusParams::Capability] }

      # @!method initialize(capabilities: nil, request_options: {})
      #   @param capabilities [Array<Symbol, Surge::Models::AccountRetrieveStatusParams::Capability>]
      #   @param request_options [Surge::RequestOptions, Hash{Symbol=>Object}]

      module Capability
        extend Surge::Internal::Type::Enum

        LOCAL_MESSAGING = :local_messaging

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
