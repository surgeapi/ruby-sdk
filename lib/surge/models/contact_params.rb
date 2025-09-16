# frozen_string_literal: true

module Surge
  module Models
    class ContactParams < Surge::Internal::Type::BaseModel
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
      optional :metadata, Surge::Internal::Type::HashOf[String]

      # @!method initialize(phone_number:, email: nil, first_name: nil, last_name: nil, metadata: nil)
      #   Parameters for creating a contact
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
    end
  end
end
