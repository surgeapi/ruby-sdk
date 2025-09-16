# typed: strong

module SurgeAPI
  module Models
    class UserParams < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SurgeAPI::UserParams, SurgeAPI::Internal::AnyHash)
        end

      # The user's first name.
      sig { returns(String) }
      attr_accessor :first_name

      # The user's last name.
      sig { returns(T.nilable(String)) }
      attr_reader :last_name

      sig { params(last_name: String).void }
      attr_writer :last_name

      # Set of key-value pairs that will be stored with the object.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # URL of a photo to be used as the user's avatar.
      sig { returns(T.nilable(String)) }
      attr_reader :photo_url

      sig { params(photo_url: String).void }
      attr_writer :photo_url

      # POST body for creating a user
      sig do
        params(
          first_name: String,
          last_name: String,
          metadata: T::Hash[Symbol, String],
          photo_url: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The user's first name.
        first_name:,
        # The user's last name.
        last_name: nil,
        # Set of key-value pairs that will be stored with the object.
        metadata: nil,
        # URL of a photo to be used as the user's avatar.
        photo_url: nil
      )
      end

      sig do
        override.returns(
          {
            first_name: String,
            last_name: String,
            metadata: T::Hash[Symbol, String],
            photo_url: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
