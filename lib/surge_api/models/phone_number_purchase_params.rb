# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::PhoneNumbers#purchase
    class PhoneNumberPurchaseParams < SurgeAPI::Models::PhoneNumberPurchaseParams
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
