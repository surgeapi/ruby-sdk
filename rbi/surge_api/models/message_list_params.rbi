# typed: strong

module SurgeAPI
  module Models
    class MessageListParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::MessageListParams, SurgeAPI::Internal::AnyHash)
        end

      # Cursor for forward pagination. Use the next_cursor from a previous response.
      sig { returns(T.nilable(String)) }
      attr_reader :after

      sig { params(after: String).void }
      attr_writer :after

      # Cursor for backward pagination. Use the previous_cursor from a previous
      # response.
      sig { returns(T.nilable(String)) }
      attr_reader :before

      sig { params(before: String).void }
      attr_writer :before

      sig do
        params(
          after: String,
          before: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor for forward pagination. Use the next_cursor from a previous response.
        after: nil,
        # Cursor for backward pagination. Use the previous_cursor from a previous
        # response.
        before: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            after: String,
            before: String,
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
