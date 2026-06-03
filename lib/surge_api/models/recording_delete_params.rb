# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Recordings#delete
    class RecordingDeleteParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute id
      #   The ID of the recording.
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:, request_options: {})
      #   @param id [String] The ID of the recording.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
