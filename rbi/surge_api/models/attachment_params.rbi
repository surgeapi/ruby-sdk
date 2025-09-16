# typed: strong

module SurgeAPI
  module Models
    class AttachmentParams < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SurgeAPI::AttachmentParams, SurgeAPI::Internal::AnyHash)
        end

      # The URL of the attachment.
      sig { returns(String) }
      attr_accessor :url

      # Params for creating an attachment
      sig { params(url: String).returns(T.attached_class) }
      def self.new(
        # The URL of the attachment.
        url:
      )
      end

      sig { override.returns({ url: String }) }
      def to_hash
      end
    end
  end
end
