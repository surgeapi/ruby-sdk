# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Users#create
    class UserCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute first_name
      #   The user's first name.
      #
      #   @return [String]
      required :first_name, String

      # @!attribute last_name
      #   The user's last name.
      #
      #   @return [String, nil]
      optional :last_name, String

      # @!attribute metadata
      #   Set of key-value pairs that will be stored with the object.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, SurgeAPI::Internal::Type::HashOf[String]

      # @!attribute photo_url
      #   URL of a photo to be used as the user's avatar.
      #
      #   @return [String, nil]
      optional :photo_url, String

      # @!method initialize(first_name:, last_name: nil, metadata: nil, photo_url: nil, request_options: {})
      #   @param first_name [String] The user's first name.
      #
      #   @param last_name [String] The user's last name.
      #
      #   @param metadata [Hash{Symbol=>String}] Set of key-value pairs that will be stored with the object.
      #
      #   @param photo_url [String] URL of a photo to be used as the user's avatar.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
