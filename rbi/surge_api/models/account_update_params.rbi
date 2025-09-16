# typed: strong

module SurgeAPI
  module Models
    class AccountUpdateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::AccountUpdateParams, SurgeAPI::Internal::AnyHash)
        end

      # The name by which the people this account communicates with know it. If not
      # provided, this will match the name field.
      sig { returns(T.nilable(String)) }
      attr_reader :brand_name

      sig { params(brand_name: String).void }
      attr_writer :brand_name

      # The name of the account that will be visible for your internal organizational
      # purposes. This will also be the default public-facing brand name unless you also
      # set a `brand_name`, but otherwise the account name will never be displayed
      # anywhere outside of Surge HQ, and may include your ID for the account or
      # anything else that may help you.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Parameters describing the legal entity on whose behalf the account will be
      # operated.
      sig { returns(T.nilable(SurgeAPI::OrganizationParams)) }
      attr_reader :organization

      sig { params(organization: SurgeAPI::OrganizationParams::OrHash).void }
      attr_writer :organization

      # The time zone for the account
      sig { returns(T.nilable(String)) }
      attr_accessor :time_zone

      sig do
        params(
          brand_name: String,
          name: String,
          organization: SurgeAPI::OrganizationParams::OrHash,
          time_zone: T.nilable(String),
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The name by which the people this account communicates with know it. If not
        # provided, this will match the name field.
        brand_name: nil,
        # The name of the account that will be visible for your internal organizational
        # purposes. This will also be the default public-facing brand name unless you also
        # set a `brand_name`, but otherwise the account name will never be displayed
        # anywhere outside of Surge HQ, and may include your ID for the account or
        # anything else that may help you.
        name: nil,
        # Parameters describing the legal entity on whose behalf the account will be
        # operated.
        organization: nil,
        # The time zone for the account
        time_zone: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            brand_name: String,
            name: String,
            organization: SurgeAPI::OrganizationParams,
            time_zone: T.nilable(String),
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
