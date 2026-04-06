# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Audiences#create
    class AudienceCreateResponse < SurgeAPI::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the object.
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   A name to identify this Audience. This name will only be visible within Surge.
      #
      #   @return [String]
      required :name, String

      # @!method initialize(id:, name:)
      #   A group of contacts used for targeting messages.
      #
      #   @param id [String] Unique identifier for the object.
      #
      #   @param name [String] A name to identify this Audience. This name will only be visible within Surge.
    end
  end
end
