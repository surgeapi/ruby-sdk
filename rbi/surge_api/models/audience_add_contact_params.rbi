# typed: strong

module SurgeAPI
  module Models
    class AudienceAddContactParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::AudienceAddContactParams, SurgeAPI::Internal::AnyHash)
        end

      # The audience ID to add the contact to.
      sig { returns(String) }
      attr_accessor :audience_id

      # The ID of the contact to add. The contact must belong to the same account as the
      # audience.
      sig { returns(String) }
      attr_accessor :id

      sig do
        params(
          audience_id: String,
          id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The audience ID to add the contact to.
        audience_id:,
        # The ID of the contact to add. The contact must belong to the same account as the
        # audience.
        id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            audience_id: String,
            id: String,
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
