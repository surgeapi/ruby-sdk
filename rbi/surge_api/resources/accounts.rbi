# typed: strong

module SurgeAPI
  module Resources
    class Accounts
      # Creates a new Account within the calling Platform.
      sig do
        params(
          name: String,
          brand_name: T.nilable(String),
          organization: SurgeAPI::AccountCreateParams::Organization::OrHash,
          time_zone: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Account)
      end
      def create(
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
        time_zone: nil,
        request_options: {}
      )
      end

      # Updates an Account
      sig do
        params(
          id: String,
          brand_name: String,
          name: String,
          organization: SurgeAPI::AccountUpdateParams::Organization::OrHash,
          time_zone: T.nilable(String),
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Account)
      end
      def update(
        # The ID for the account to update.
        id,
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

      # Check an account's status and capabilities
      sig do
        params(
          account_id: String,
          capabilities:
            T::Array[
              SurgeAPI::AccountRetrieveStatusParams::Capability::OrSymbol
            ],
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::AccountStatus)
      end
      def retrieve_status(
        # ID of the account to check
        account_id,
        # capabilities about which to check the status
        capabilities: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: SurgeAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
