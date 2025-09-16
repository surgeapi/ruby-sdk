# frozen_string_literal: true

module SurgeAPI
  module Models
    class Error < SurgeAPI::Internal::Type::BaseModel
      # @!attribute message
      #   A human-readable error message.
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #   A unique error code.
      #
      #   @return [String]
      required :type, String

      # @!attribute detail
      #   Additional details about the error.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :detail, SurgeAPI::Internal::Type::HashOf[SurgeAPI::Internal::Type::Unknown]

      # @!method initialize(message:, type:, detail: nil)
      #   An error response
      #
      #   @param message [String] A human-readable error message.
      #
      #   @param type [String] A unique error code.
      #
      #   @param detail [Hash{Symbol=>Object}] Additional details about the error.
    end
  end
end
