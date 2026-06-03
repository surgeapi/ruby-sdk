# typed: strong

module SurgeAPI
  module Models
    class RecordingGetFileParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::RecordingGetFileParams, SurgeAPI::Internal::AnyHash)
        end

      # The ID of the recording.
      sig { returns(String) }
      attr_accessor :recording_id

      sig do
        params(
          recording_id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the recording.
        recording_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { recording_id: String, request_options: SurgeAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
