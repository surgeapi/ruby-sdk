# typed: strong

module Surge
  module Models
    class Error < Surge::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Surge::Error, Surge::Internal::AnyHash) }

      # A human-readable error message.
      sig { returns(String) }
      attr_accessor :message

      # A unique error code.
      sig { returns(String) }
      attr_accessor :type

      # Additional details about the error.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :detail

      sig { params(detail: T::Hash[Symbol, T.anything]).void }
      attr_writer :detail

      # An error response
      sig do
        params(
          message: String,
          type: String,
          detail: T::Hash[Symbol, T.anything]
        ).returns(T.attached_class)
      end
      def self.new(
        # A human-readable error message.
        message:,
        # A unique error code.
        type:,
        # Additional details about the error.
        detail: nil
      )
      end

      sig do
        override.returns(
          { message: String, type: String, detail: T::Hash[Symbol, T.anything] }
        )
      end
      def to_hash
      end
    end
  end
end
