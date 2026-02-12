# frozen_string_literal: true

module SurgeAPI
  module Resources
    class Recordings
      # Redirects to a signed URL where the recording audio file can be downloaded. URL
      # is short-lived, so redirect should be followed immediately.
      #
      # @overload get_file(recording_id, request_options: {})
      #
      # @param recording_id [String] The ID of the recording.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::RecordingGetFileResponse]
      #
      # @see SurgeAPI::Models::RecordingGetFileParams
      def get_file(recording_id, params = {})
        @client.request(
          method: :get,
          path: ["recordings/%1$s/file", recording_id],
          model: SurgeAPI::Models::RecordingGetFileResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [SurgeAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
