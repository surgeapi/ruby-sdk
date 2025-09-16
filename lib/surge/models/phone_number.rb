# frozen_string_literal: true

module Surge
  module Models
    # @see Surge::Resources::PhoneNumbers#purchase
    class PhoneNumber < Surge::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the phone number
      #
      #   @return [String]
      required :id, String

      # @!attribute number
      #   The phone number in E.164 format
      #
      #   @return [String]
      required :number, String

      # @!attribute type
      #   Whether the phone number is local, toll-free, or short code
      #
      #   @return [Symbol, Surge::Models::PhoneNumber::Type]
      required :type, enum: -> { Surge::PhoneNumber::Type }

      # @!method initialize(id:, number:, type:)
      #   A phone number that can be used to send and receive messages and calls
      #
      #   @param id [String] Unique identifier for the phone number
      #
      #   @param number [String] The phone number in E.164 format
      #
      #   @param type [Symbol, Surge::Models::PhoneNumber::Type] Whether the phone number is local, toll-free, or short code

      # Whether the phone number is local, toll-free, or short code
      #
      # @see Surge::Models::PhoneNumber#type
      module Type
        extend Surge::Internal::Type::Enum

        LOCAL = :local
        TOLL_FREE = :toll_free

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
