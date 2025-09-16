# typed: strong

module SurgeAPI
  module Models
    class AccountRetrieveStatusParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::AccountRetrieveStatusParams,
            SurgeAPI::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.nilable(
            T::Array[
              SurgeAPI::AccountRetrieveStatusParams::Capability::OrSymbol
            ]
          )
        )
      end
      attr_reader :capabilities

      sig do
        params(
          capabilities:
            T::Array[
              SurgeAPI::AccountRetrieveStatusParams::Capability::OrSymbol
            ]
        ).void
      end
      attr_writer :capabilities

      sig do
        params(
          capabilities:
            T::Array[
              SurgeAPI::AccountRetrieveStatusParams::Capability::OrSymbol
            ],
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(capabilities: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            capabilities:
              T::Array[
                SurgeAPI::AccountRetrieveStatusParams::Capability::OrSymbol
              ],
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Capability
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, SurgeAPI::AccountRetrieveStatusParams::Capability)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOCAL_MESSAGING =
          T.let(
            :local_messaging,
            SurgeAPI::AccountRetrieveStatusParams::Capability::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              SurgeAPI::AccountRetrieveStatusParams::Capability::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
