# frozen_string_literal: true

module Surge
  module Models
    # @see Surge::Resources::Users#create
    class User < Surge::Internal::Type::BaseModel
      # @!attribute first_name
      #   The user's first name.
      #
      #   @return [String]
      required :first_name, String

      # @!attribute id
      #   Unique identifier for the object.
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute last_name
      #   The user's last name.
      #
      #   @return [String, nil]
      optional :last_name, String

      # @!attribute metadata
      #   Set of key-value pairs that will be stored with the object.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Surge::Internal::Type::HashOf[String]

      # @!attribute photo_url
      #   URL of a photo to be used as the user's avatar.
      #
      #   @return [String, nil]
      optional :photo_url, String

      # @!method initialize(first_name:, id: nil, last_name: nil, metadata: nil, photo_url: nil)
      #   A user of the app
      #
      #   @param first_name [String] The user's first name.
      #
      #   @param id [String] Unique identifier for the object.
      #
      #   @param last_name [String] The user's last name.
      #
      #   @param metadata [Hash{Symbol=>String}] Set of key-value pairs that will be stored with the object.
      #
      #   @param photo_url [String] URL of a photo to be used as the user's avatar.
    end
  end
end
