# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Recordings#get_file
    class RecordingGetFileParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute recording_id
      #   The ID of the recording.
      #
      #   @return [String]
      required :recording_id, String

      # @!method initialize(recording_id:, request_options: {})
      #   @param recording_id [String] The ID of the recording.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
