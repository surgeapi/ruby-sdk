# typed: strong

module SurgeAPI
  module Resources
    class Recordings
      # Redirects to a signed URL where the recording audio file can be downloaded. URL
      # is short-lived, so redirect should be followed immediately.
      sig do
        params(
          recording_id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Models::RecordingGetFileResponse)
      end
      def get_file(
        # The ID of the recording.
        recording_id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: SurgeAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
