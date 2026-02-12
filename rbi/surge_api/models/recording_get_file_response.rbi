# typed: strong

module SurgeAPI
  module Models
    class RecordingGetFileResponse < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::Models::RecordingGetFileResponse,
            SurgeAPI::Internal::AnyHash
          )
        end

      # An error response
      sig { returns(SurgeAPI::Error) }
      attr_reader :error

      sig { params(error: SurgeAPI::Error::OrHash).void }
      attr_writer :error

      # An error response
      sig { params(error: SurgeAPI::Error::OrHash).returns(T.attached_class) }
      def self.new(
        # An error response
        error:
      )
      end

      sig { override.returns({ error: SurgeAPI::Error }) }
      def to_hash
      end
    end
  end
end
