# typed: strong

module SurgeAPI
  module Resources
    class Attachments
      # Redirects to a signed URL where the attachment file can be downloaded. URL is
      # short-lived, so redirect should be followed immediately.
      sig do
        params(
          attachment_id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Models::AttachmentGetFileResponse)
      end
      def get_file(
        # The ID of the attachment.
        attachment_id,
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
