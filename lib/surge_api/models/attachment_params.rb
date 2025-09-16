# frozen_string_literal: true

module SurgeAPI
  module Models
    class AttachmentParams < SurgeAPI::Internal::Type::BaseModel
      # @!attribute url
      #   The URL of the attachment.
      #
      #   @return [String]
      required :url, String

      # @!method initialize(url:)
      #   Params for creating an attachment
      #
      #   @param url [String] The URL of the attachment.
    end
  end
end
