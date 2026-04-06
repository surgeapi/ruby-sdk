# typed: strong

module SurgeAPI
  module Models
    class AudienceCreateResponse < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::Models::AudienceCreateResponse,
            SurgeAPI::Internal::AnyHash
          )
        end

      # Unique identifier for the object.
      sig { returns(String) }
      attr_accessor :id

      # A name to identify this Audience. This name will only be visible within Surge.
      sig { returns(String) }
      attr_accessor :name

      # A group of contacts used for targeting messages.
      sig { params(id: String, name: String).returns(T.attached_class) }
      def self.new(
        # Unique identifier for the object.
        id:,
        # A name to identify this Audience. This name will only be visible within Surge.
        name:
      )
      end

      sig { override.returns({ id: String, name: String }) }
      def to_hash
      end
    end
  end
end
