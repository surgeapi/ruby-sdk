# typed: strong

module SurgeAPI
  module Models
    class Contact < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(SurgeAPI::Contact, SurgeAPI::Internal::AnyHash) }

      # Unique identifier for the object.
      sig { returns(String) }
      attr_accessor :id

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

      # A contact who has consented to receive messages
      sig do
        params(
          id: String,
          phone_number: String,
          email: String,
          first_name: String,
          last_name: String,
          metadata: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the object.
        id:,
        # The contact's phone number in E.164 format.
        phone_number:,
        # The contact's email address.
        email: nil,
        # The contact's first name.
        first_name: nil,
        # The contact's last name.
        last_name: nil,
        # Set of key-value pairs that will be stored with the object.
        metadata: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            phone_number: String,
            email: String,
            first_name: String,
            last_name: String,
            metadata: T::Hash[Symbol, String]
          }
        )
      end
      def to_hash
      end
    end
  end
end
