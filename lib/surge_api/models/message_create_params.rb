# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Messages#create
    class MessageCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute message_params
      #   Payload for creating a message. Either an attachment or the body must be given.
      #   You can specify the recipient either using the 'conversation' parameter or the
      #   'to'/'from' parameters, but not both.
      #
      #   @return [SurgeAPI::Models::MessageParams::MessageParamsWithConversation, SurgeAPI::Models::MessageParams::SimpleMessageParams]
      required :message_params, union: -> { SurgeAPI::MessageParams }

      # @!method initialize(message_params:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::MessageCreateParams} for more details.
      #
      #   @param message_params [SurgeAPI::Models::MessageParams::MessageParamsWithConversation, SurgeAPI::Models::MessageParams::SimpleMessageParams] Payload for creating a message. Either an attachment or the body must be given.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
