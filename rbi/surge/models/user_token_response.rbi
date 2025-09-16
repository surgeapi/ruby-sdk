# typed: strong

module Surge
  module Models
    class UserTokenResponse < Surge::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Surge::UserTokenResponse, Surge::Internal::AnyHash)
        end

      # The created token.
      sig { returns(T.nilable(String)) }
      attr_reader :token

      sig { params(token: String).void }
      attr_writer :token

      # Response when token has been created successfully
      sig { params(token: String).returns(T.attached_class) }
      def self.new(
        # The created token.
        token: nil
      )
      end

      sig { override.returns({ token: String }) }
      def to_hash
      end
    end
  end
end
