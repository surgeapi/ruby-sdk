# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Accounts#retrieve_status
    class AccountStatus < SurgeAPI::Internal::Type::BaseModel
      # @!attribute capabilities
      #   An object where the fields are the capabilities passed in the `capabilities`
      #   query param, as in `local_messaging`.
      #
      #   @return [Hash{Symbol=>SurgeAPI::Models::AccountStatus::Capability}]
      required :capabilities, -> { SurgeAPI::Internal::Type::HashOf[SurgeAPI::AccountStatus::Capability] }

      # @!method initialize(capabilities:)
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::AccountStatus} for more details.
      #
      #   Response containing account status information
      #
      #   @param capabilities [Hash{Symbol=>SurgeAPI::Models::AccountStatus::Capability}] An object where the fields are the capabilities passed in the `capabilities` que

      class Capability < SurgeAPI::Internal::Type::BaseModel
        # @!attribute errors
        #   A list of errors that will need corrected before capability is available to
        #   account.
        #
        #   @return [Array<SurgeAPI::Models::AccountStatus::Capability::Error>]
        required :errors, -> { SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::AccountStatus::Capability::Error] }

        # @!attribute fields_needed
        #   A list of missing fields that are required for the capability. Nested field
        #   names are dot-delimited, as in `organization.address.region`.
        #
        #   @return [Array<String>]
        required :fields_needed, SurgeAPI::Internal::Type::ArrayOf[String]

        # @!attribute status
        #   Whether the account is ready for the capability, has errors that need corrected,
        #   or is incomplete and requires missing data. If account has both missing and
        #   invalid fields, `error` will be preferred over `incomplete`.
        #
        #   @return [Symbol, SurgeAPI::Models::AccountStatus::Capability::Status]
        required :status, enum: -> { SurgeAPI::AccountStatus::Capability::Status }

        # @!method initialize(errors:, fields_needed:, status:)
        #   Some parameter documentations has been truncated, see
        #   {SurgeAPI::Models::AccountStatus::Capability} for more details.
        #
        #   @param errors [Array<SurgeAPI::Models::AccountStatus::Capability::Error>] A list of errors that will need corrected before capability is available to acco
        #
        #   @param fields_needed [Array<String>] A list of missing fields that are required for the capability. Nested field name
        #
        #   @param status [Symbol, SurgeAPI::Models::AccountStatus::Capability::Status] Whether the account is ready for the capability, has errors that need corrected,

        class Error < SurgeAPI::Internal::Type::BaseModel
          # @!attribute field
          #   A dot-delimited string representing the field that has an error, as in
          #   `organization.contact.phone_number`.
          #
          #   @return [String]
          required :field, String

          # @!attribute message
          #   A human-readable string explaining the error.
          #
          #   @return [String]
          required :message, String

          # @!attribute type
          #   A slug for the error type
          #
          #   @return [String]
          required :type, String

          # @!method initialize(field:, message:, type:)
          #   Some parameter documentations has been truncated, see
          #   {SurgeAPI::Models::AccountStatus::Capability::Error} for more details.
          #
          #   @param field [String] A dot-delimited string representing the field that has an error, as in `organiza
          #
          #   @param message [String] A human-readable string explaining the error.
          #
          #   @param type [String] A slug for the error type
        end

        # Whether the account is ready for the capability, has errors that need corrected,
        # or is incomplete and requires missing data. If account has both missing and
        # invalid fields, `error` will be preferred over `incomplete`.
        #
        # @see SurgeAPI::Models::AccountStatus::Capability#status
        module Status
          extend SurgeAPI::Internal::Type::Enum

          ERROR = :error
          INCOMPLETE = :incomplete
          READY = :ready

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
