# typed: strong

module SurgeAPI
  module Models
    class AccountParams < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SurgeAPI::AccountParams, SurgeAPI::Internal::AnyHash)
        end

      # The name of the account that will be visible for your internal organizational
      # purposes. This will also be the default public-facing brand name unless you also
      # set a `brand_name`, but otherwise the account name will never be displayed
      # anywhere outside of Surge HQ, and may include your ID for the account or
      # anything else that may help you.
      sig { returns(String) }
      attr_accessor :name

      # The name by which the people this account communicates with know it. If not
      # provided, this will match the name field.
      sig { returns(T.nilable(String)) }
      attr_accessor :brand_name

      # Parameters describing the legal entity on whose behalf the account will be
      # operated.
      sig { returns(T.nilable(SurgeAPI::OrganizationParams)) }
      attr_reader :organization

      sig { params(organization: SurgeAPI::OrganizationParams::OrHash).void }
      attr_writer :organization

      # This is the time zone in which the account is headquartered. This time zone may
      # be used for compliance with TCPA restrictions on when messages may be sent.
      sig { returns(T.nilable(String)) }
      attr_reader :time_zone

      sig { params(time_zone: String).void }
      attr_writer :time_zone

      # Parameters for creating a new account.
      sig do
        params(
          name: String,
          brand_name: T.nilable(String),
          organization: SurgeAPI::OrganizationParams::OrHash,
          time_zone: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The name of the account that will be visible for your internal organizational
        # purposes. This will also be the default public-facing brand name unless you also
        # set a `brand_name`, but otherwise the account name will never be displayed
        # anywhere outside of Surge HQ, and may include your ID for the account or
        # anything else that may help you.
        name:,
        # The name by which the people this account communicates with know it. If not
        # provided, this will match the name field.
        brand_name: nil,
        # Parameters describing the legal entity on whose behalf the account will be
        # operated.
        organization: nil,
        # This is the time zone in which the account is headquartered. This time zone may
        # be used for compliance with TCPA restrictions on when messages may be sent.
        time_zone: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            brand_name: T.nilable(String),
            organization: SurgeAPI::OrganizationParams,
            time_zone: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
