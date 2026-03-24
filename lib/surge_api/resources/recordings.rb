# frozen_string_literal: true

module SurgeAPI
  module Resources
    class Recordings
      # Retrieves a Recording object.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] The ID of the recording to retrieve.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::RecordingRetrieveResponse]
      #
      # @see SurgeAPI::Models::RecordingRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["recordings/%1$s", id],
          model: SurgeAPI::Models::RecordingRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::RecordingListParams} for more details.
      #
      # List all recordings for an account with cursor-based pagination.
      #
      # @overload list(account_id, after: nil, before: nil, request_options: {})
      #
      # @param account_id [String] The account ID to list recordings for.
      #
      # @param after [String] Cursor for forward pagination. Use the next_cursor from a previous response.
      #
      # @param before [String] Cursor for backward pagination. Use the previous_cursor from a previous response
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Internal::Cursor<SurgeAPI::Models::RecordingListResponse>]
      #
      # @see SurgeAPI::Models::RecordingListParams
      def list(account_id, params = {})
        parsed, options = SurgeAPI::RecordingListParams.dump_request(params)
        query = SurgeAPI::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["accounts/%1$s/recordings", account_id],
          query: query,
          page: SurgeAPI::Internal::Cursor,
          model: SurgeAPI::Models::RecordingListResponse,
          options: options
        )
      end

      # Deletes a recording. The recording file will be removed from storage
      # asynchronously.
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] The ID of the recording.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::RecordingDeleteResponse]
      #
      # @see SurgeAPI::Models::RecordingDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["recordings/%1$s", id],
          model: SurgeAPI::Models::RecordingDeleteResponse,
          options: params[:request_options]
        )
      end

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
