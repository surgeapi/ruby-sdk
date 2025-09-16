# typed: strong

module Surge
  module Models
    class AccountRetrieveStatusParams < Surge::Internal::Type::BaseModel
      extend Surge::Internal::Type::RequestParameters::Converter
      include Surge::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Surge::AccountRetrieveStatusParams, Surge::Internal::AnyHash)
        end

      sig do
        returns(
          T.nilable(
            T::Array[Surge::AccountRetrieveStatusParams::Capability::OrSymbol]
          )
        )
      end
      attr_reader :capabilities

      sig do
        params(
          capabilities:
            T::Array[Surge::AccountRetrieveStatusParams::Capability::OrSymbol]
        ).void
      end
      attr_writer :capabilities

      sig do
        params(
          capabilities:
            T::Array[Surge::AccountRetrieveStatusParams::Capability::OrSymbol],
          request_options: Surge::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(capabilities: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            capabilities:
              T::Array[
                Surge::AccountRetrieveStatusParams::Capability::OrSymbol
              ],
            request_options: Surge::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Capability
        extend Surge::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Surge::AccountRetrieveStatusParams::Capability)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOCAL_MESSAGING =
          T.let(
            :local_messaging,
            Surge::AccountRetrieveStatusParams::Capability::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Surge::AccountRetrieveStatusParams::Capability::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
