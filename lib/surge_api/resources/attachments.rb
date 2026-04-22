# frozen_string_literal: true

module SurgeAPI
  module Resources
    class Attachments
      # Redirects to a signed URL where the attachment file can be downloaded. URL is
      # short-lived, so redirect should be followed immediately.
      #
      # @overload get_file(attachment_id, request_options: {})
      #
      # @param attachment_id [String] The ID of the attachment.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::AttachmentGetFileResponse]
      #
      # @see SurgeAPI::Models::AttachmentGetFileParams
      def get_file(attachment_id, params = {})
        @client.request(
          method: :get,
          path: ["attachments/%1$s/file", attachment_id],
          model: SurgeAPI::Models::AttachmentGetFileResponse,
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
