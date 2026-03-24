# typed: strong

module SurgeAPI
  module Resources
    class Recordings
      # Retrieves a Recording object.
      sig do
        params(
          id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Models::RecordingRetrieveResponse)
      end
      def retrieve(
        # The ID of the recording to retrieve.
        id,
        request_options: {}
      )
      end

      # List all recordings for an account with cursor-based pagination.
      sig do
        params(
          account_id: String,
          after: String,
          before: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(
          SurgeAPI::Internal::Cursor[SurgeAPI::Models::RecordingListResponse]
        )
      end
      def list(
        # The account ID to list recordings for.
        account_id,
        # Cursor for forward pagination. Use the next_cursor from a previous response.
        after: nil,
        # Cursor for backward pagination. Use the previous_cursor from a previous
        # response.
        before: nil,
        request_options: {}
      )
      end

      # Deletes a recording. The recording file will be removed from storage
      # asynchronously.
      sig do
        params(
          id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Models::RecordingDeleteResponse)
      end
      def delete(
        # The ID of the recording.
        id,
        request_options: {}
      )
      end

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
