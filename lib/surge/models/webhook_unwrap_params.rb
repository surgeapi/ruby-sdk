# frozen_string_literal: true

module Surge
  module Models
    # @see Surge::Resources::Webhooks#unwrap
    class WebhookUnwrapParams < Surge::Internal::Type::BaseModel
      extend Surge::Internal::Type::RequestParameters::Converter
      include Surge::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Surge::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
