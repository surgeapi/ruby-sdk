# typed: strong

module SurgeAPI
  module Models
    class AccountStatus < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SurgeAPI::AccountStatus, SurgeAPI::Internal::AnyHash)
        end

      # An object where the fields are the capabilities passed in the `capabilities`
      # query param, as in `local_messaging`.
      sig { returns(T::Hash[Symbol, SurgeAPI::AccountStatus::Capability]) }
      attr_accessor :capabilities

      # Response containing account status information
      sig do
        params(
          capabilities:
            T::Hash[Symbol, SurgeAPI::AccountStatus::Capability::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # An object where the fields are the capabilities passed in the `capabilities`
        # query param, as in `local_messaging`.
        capabilities:
      )
      end

      sig do
        override.returns(
          { capabilities: T::Hash[Symbol, SurgeAPI::AccountStatus::Capability] }
        )
      end
      def to_hash
      end

      class Capability < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::AccountStatus::Capability,
              SurgeAPI::Internal::AnyHash
            )
          end

        # A list of errors that will need corrected before capability is available to
        # account.
        sig { returns(T::Array[SurgeAPI::AccountStatus::Capability::Error]) }
        attr_accessor :errors

        # A list of missing fields that are required for the capability. Nested field
        # names are dot-delimited, as in `organization.address.region`.
        sig { returns(T::Array[String]) }
        attr_accessor :fields_needed

        # Whether the account is ready for the capability, has errors that need corrected,
        # or is incomplete and requires missing data. If account has both missing and
        # invalid fields, `error` will be preferred over `incomplete`.
        sig do
          returns(SurgeAPI::AccountStatus::Capability::Status::TaggedSymbol)
        end
        attr_accessor :status

        sig do
          params(
            errors:
              T::Array[SurgeAPI::AccountStatus::Capability::Error::OrHash],
            fields_needed: T::Array[String],
            status: SurgeAPI::AccountStatus::Capability::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # A list of errors that will need corrected before capability is available to
          # account.
          errors:,
          # A list of missing fields that are required for the capability. Nested field
          # names are dot-delimited, as in `organization.address.region`.
          fields_needed:,
          # Whether the account is ready for the capability, has errors that need corrected,
          # or is incomplete and requires missing data. If account has both missing and
          # invalid fields, `error` will be preferred over `incomplete`.
          status:
        )
        end

        sig do
          override.returns(
            {
              errors: T::Array[SurgeAPI::AccountStatus::Capability::Error],
              fields_needed: T::Array[String],
              status: SurgeAPI::AccountStatus::Capability::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        class Error < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::AccountStatus::Capability::Error,
                SurgeAPI::Internal::AnyHash
              )
            end

          # A dot-delimited string representing the field that has an error, as in
          # `organization.contact.phone_number`.
          sig { returns(String) }
          attr_accessor :field

          # A human-readable string explaining the error.
          sig { returns(String) }
          attr_accessor :message

          # A slug for the error type
          sig { returns(String) }
          attr_accessor :type

          sig do
            params(field: String, message: String, type: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # A dot-delimited string representing the field that has an error, as in
            # `organization.contact.phone_number`.
            field:,
            # A human-readable string explaining the error.
            message:,
            # A slug for the error type
            type:
          )
          end

          sig do
            override.returns({ field: String, message: String, type: String })
          end
          def to_hash
          end
        end

        # Whether the account is ready for the capability, has errors that need corrected,
        # or is incomplete and requires missing data. If account has both missing and
        # invalid fields, `error` will be preferred over `incomplete`.
        module Status
          extend SurgeAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, SurgeAPI::AccountStatus::Capability::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ERROR =
            T.let(
              :error,
              SurgeAPI::AccountStatus::Capability::Status::TaggedSymbol
            )
          INCOMPLETE =
            T.let(
              :incomplete,
              SurgeAPI::AccountStatus::Capability::Status::TaggedSymbol
            )
          READY =
            T.let(
              :ready,
              SurgeAPI::AccountStatus::Capability::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::AccountStatus::Capability::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
