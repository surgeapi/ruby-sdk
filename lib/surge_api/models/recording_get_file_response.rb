# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Recordings#get_file
    class RecordingGetFileResponse < SurgeAPI::Internal::Type::BaseModel
      # @!attribute error
      #   An error response
      #
      #   @return [SurgeAPI::Models::Error]
      required :error, -> { SurgeAPI::Error }

      # @!method initialize(error:)
      #   An error response
      #
      #   @param error [SurgeAPI::Models::Error] An error response
    end
  end
end
