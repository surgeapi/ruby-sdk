# typed: strong

module Surge
  module Models
    class MessageCreateParams < Surge::Internal::Type::BaseModel
      extend Surge::Internal::Type::RequestParameters::Converter
      include Surge::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Surge::MessageCreateParams, Surge::Internal::AnyHash)
        end

      # Payload for creating a message. Either an attachment or the body must be given.
      # You can specify the recipient either using the 'conversation' parameter or the
      # 'to'/'from' parameters, but not both.
      sig do
        returns(
          T.any(
            Surge::MessageParams::MessageParamsWithConversation,
            Surge::MessageParams::SimpleMessageParams
          )
        )
      end
      attr_accessor :message_params

      sig do
        params(
          message_params:
            T.any(
              Surge::MessageParams::MessageParamsWithConversation::OrHash,
              Surge::MessageParams::SimpleMessageParams::OrHash
            ),
          request_options: Surge::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Payload for creating a message. Either an attachment or the body must be given.
        # You can specify the recipient either using the 'conversation' parameter or the
        # 'to'/'from' parameters, but not both.
        message_params:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            message_params:
              T.any(
                Surge::MessageParams::MessageParamsWithConversation,
                Surge::MessageParams::SimpleMessageParams
              ),
            request_options: Surge::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
