# typed: strong

module Surge
  module Models
    class Account < Surge::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Surge::Account, Surge::Internal::AnyHash) }

      # The account ID
      sig { returns(String) }
      attr_accessor :id

      # The name by which the people this account communicates with know it. If not
      # provided, this will match the name field.
      sig { returns(T.nilable(String)) }
      attr_accessor :brand_name

      # The name of the account that will be visible for your internal organizational
      # purposes. This will also be the default public-facing brand name unless you also
      # set a `brand_name`, but otherwise the account name will never be displayed
      # anywhere outside of Surge HQ, and may include your ID for the account or
      # anything else that may help you.
      sig { returns(String) }
      attr_accessor :name

      # The legal entity on whose behalf the account will be operated.
      sig { returns(Surge::Organization) }
      attr_reader :organization

      sig { params(organization: Surge::Organization::OrHash).void }
      attr_writer :organization

      # This is the time zone in which the account is headquartered. This time zone may
      # be used for compliance with TCPA restrictions on when messages may be sent.
      sig { returns(T.nilable(String)) }
      attr_accessor :time_zone

      # Response containing account information.
      sig do
        params(
          id: String,
          brand_name: T.nilable(String),
          name: String,
          organization: Surge::Organization::OrHash,
          time_zone: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The account ID
        id:,
        # The name by which the people this account communicates with know it. If not
        # provided, this will match the name field.
        brand_name:,
        # The name of the account that will be visible for your internal organizational
        # purposes. This will also be the default public-facing brand name unless you also
        # set a `brand_name`, but otherwise the account name will never be displayed
        # anywhere outside of Surge HQ, and may include your ID for the account or
        # anything else that may help you.
        name:,
        # The legal entity on whose behalf the account will be operated.
        organization:,
        # This is the time zone in which the account is headquartered. This time zone may
        # be used for compliance with TCPA restrictions on when messages may be sent.
        time_zone:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            brand_name: T.nilable(String),
            name: String,
            organization: Surge::Organization,
            time_zone: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
