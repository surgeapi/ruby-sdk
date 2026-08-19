# typed: strong

module SurgeAPI
  module Models
    class ContactCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::ContactCreateParams, SurgeAPI::Internal::AnyHash)
        end

      # The account for which the contact should be created.
      sig { returns(String) }
      attr_accessor :account_id

      # The contact's phone number in E.164 format.
      sig { returns(String) }
      attr_accessor :phone_number

      # The contact's email address.
      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      # The contact's first name.
      sig { returns(T.nilable(String)) }
      attr_reader :first_name

      sig { params(first_name: String).void }
      attr_writer :first_name

      # The contact's last name.
      sig { returns(T.nilable(String)) }
      attr_reader :last_name

      sig { params(last_name: String).void }
      attr_writer :last_name

      # Set of key-value pairs that will be stored with the object.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # Whether outbound messaging should be manually disabled for the contact.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :outbound_disabled

      sig { params(outbound_disabled: T::Boolean).void }
      attr_writer :outbound_disabled

      sig do
        params(
          account_id: String,
          phone_number: String,
          email: String,
          first_name: String,
          last_name: String,
          metadata: T::Hash[Symbol, String],
          outbound_disabled: T::Boolean,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The account for which the contact should be created.
        account_id:,
        # The contact's phone number in E.164 format.
        phone_number:,
        # The contact's email address.
        email: nil,
        # The contact's first name.
        first_name: nil,
        # The contact's last name.
        last_name: nil,
        # Set of key-value pairs that will be stored with the object.
        metadata: nil,
        # Whether outbound messaging should be manually disabled for the contact.
        outbound_disabled: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            phone_number: String,
            email: String,
            first_name: String,
            last_name: String,
            metadata: T::Hash[Symbol, String],
            outbound_disabled: T::Boolean,
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
