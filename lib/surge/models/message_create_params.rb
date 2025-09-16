# frozen_string_literal: true

module Surge
  module Models
    # @see Surge::Resources::Messages#create
    class MessageCreateParams < Surge::Internal::Type::BaseModel
      extend Surge::Internal::Type::RequestParameters::Converter
      include Surge::Internal::Type::RequestParameters

      # @!attribute message_params
      #   Payload for creating a message. Either an attachment or the body must be given.
      #   You can specify the recipient either using the 'conversation' parameter or the
      #   'to'/'from' parameters, but not both.
      #
      #   @return [Surge::Models::MessageParams::MessageParamsWithConversation, Surge::Models::MessageParams::SimpleMessageParams]
      required :message_params, union: -> { Surge::MessageParams }

      # @!method initialize(message_params:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Surge::Models::MessageCreateParams} for more details.
      #
      #   @param message_params [Surge::Models::MessageParams::MessageParamsWithConversation, Surge::Models::MessageParams::SimpleMessageParams] Payload for creating a message. Either an attachment or the body must be given.
      #
      #   @param request_options [Surge::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
