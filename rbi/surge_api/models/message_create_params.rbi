# typed: strong

module SurgeAPI
  module Models
    class MessageCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::MessageCreateParams, SurgeAPI::Internal::AnyHash)
        end

      # Payload for creating a message. Either an attachment or the body must be given.
      # You can specify the recipient either using the 'conversation' parameter or the
      # 'to'/'from' parameters, but not both.
      sig do
        returns(
          T.any(
            SurgeAPI::MessageParams::MessageParamsWithConversation,
            SurgeAPI::MessageParams::SimpleMessageParams
          )
        )
      end
      attr_accessor :message_params

      sig do
        params(
          message_params:
            T.any(
              SurgeAPI::MessageParams::MessageParamsWithConversation::OrHash,
              SurgeAPI::MessageParams::SimpleMessageParams::OrHash
            ),
          request_options: SurgeAPI::RequestOptions::OrHash
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
                SurgeAPI::MessageParams::MessageParamsWithConversation,
                SurgeAPI::MessageParams::SimpleMessageParams
              ),
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
