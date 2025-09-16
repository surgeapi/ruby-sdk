# typed: strong

module Surge
  module Models
    class VerificationParams < Surge::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Surge::VerificationParams, Surge::Internal::AnyHash)
        end

      # The phone number to be verified. In E.164 format.
      sig { returns(String) }
      attr_accessor :phone_number

      # Parameters for creating a Verification
      sig { params(phone_number: String).returns(T.attached_class) }
      def self.new(
        # The phone number to be verified. In E.164 format.
        phone_number:
      )
      end

      sig { override.returns({ phone_number: String }) }
      def to_hash
      end
    end
  end
end
