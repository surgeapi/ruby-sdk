# typed: strong

module SurgeAPI
  module Models
    class PhoneNumberUpdateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::PhoneNumberUpdateParams, SurgeAPI::Internal::AnyHash)
        end

      # The ID of the phone number to update.
      sig { returns(String) }
      attr_accessor :id

      # Campaign ID to attach this number to (`cpn_...`).
      sig { returns(T.nilable(String)) }
      attr_reader :campaign_id

      sig { params(campaign_id: String).void }
      attr_writer :campaign_id

      # Set of key-value pairs that will be stored with the object.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # A human-readable name for the phone number.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig do
        params(
          id: String,
          campaign_id: String,
          metadata: T::Hash[Symbol, String],
          name: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the phone number to update.
        id:,
        # Campaign ID to attach this number to (`cpn_...`).
        campaign_id: nil,
        # Set of key-value pairs that will be stored with the object.
        metadata: nil,
        # A human-readable name for the phone number.
        name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            campaign_id: String,
            metadata: T::Hash[Symbol, String],
            name: String,
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
