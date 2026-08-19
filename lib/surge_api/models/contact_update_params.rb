# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Contacts#update
    class ContactUpdateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute id
      #   The ID of the contact to update.
      #
      #   @return [String]
      required :id, String

      # @!attribute phone_number
      #   The contact's phone number in E.164 format.
      #
      #   @return [String]
      required :phone_number, String

      # @!attribute email
      #   The contact's email address.
      #
      #   @return [String, nil]
      optional :email, String

      # @!attribute first_name
      #   The contact's first name.
      #
      #   @return [String, nil]
      optional :first_name, String

      # @!attribute last_name
      #   The contact's last name.
      #
      #   @return [String, nil]
      optional :last_name, String

      # @!attribute metadata
      #   Set of key-value pairs that will be stored with the object.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, SurgeAPI::Internal::Type::HashOf[String]

      # @!attribute outbound_disabled
      #   Whether outbound messaging should be manually disabled for the contact.
      #
      #   @return [Boolean, nil]
      optional :outbound_disabled, SurgeAPI::Internal::Type::Boolean

      # @!method initialize(id:, phone_number:, email: nil, first_name: nil, last_name: nil, metadata: nil, outbound_disabled: nil, request_options: {})
      #   @param id [String] The ID of the contact to update.
      #
      #   @param phone_number [String] The contact's phone number in E.164 format.
      #
      #   @param email [String] The contact's email address.
      #
      #   @param first_name [String] The contact's first name.
      #
      #   @param last_name [String] The contact's last name.
      #
      #   @param metadata [Hash{Symbol=>String}] Set of key-value pairs that will be stored with the object.
      #
      #   @param outbound_disabled [Boolean] Whether outbound messaging should be manually disabled for the contact.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
