# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Attachments#get_file
    class AttachmentGetFileParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute attachment_id
      #   The ID of the attachment.
      #
      #   @return [String]
      required :attachment_id, String

      # @!method initialize(attachment_id:, request_options: {})
      #   @param attachment_id [String] The ID of the attachment.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
