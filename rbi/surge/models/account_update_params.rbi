# typed: strong

module Surge
  module Models
    class AccountUpdateParams < Surge::Models::AccountUpdateParams
      extend Surge::Internal::Type::RequestParameters::Converter
      include Surge::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Surge::AccountUpdateParams, Surge::Internal::AnyHash)
        end

      sig do
        params(request_options: Surge::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: Surge::RequestOptions }) }
      def to_hash
      end
    end
  end
end
