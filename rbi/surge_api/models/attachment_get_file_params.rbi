# typed: strong

module SurgeAPI
  module Models
    class AttachmentGetFileParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::AttachmentGetFileParams, SurgeAPI::Internal::AnyHash)
        end

      # The ID of the attachment.
      sig { returns(String) }
      attr_accessor :attachment_id

      sig do
        params(
          attachment_id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the attachment.
        attachment_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { attachment_id: String, request_options: SurgeAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
