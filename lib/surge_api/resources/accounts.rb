# frozen_string_literal: true

module SurgeAPI
  module Resources
    class Accounts
      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::AccountCreateParams} for more details.
      #
      # Creates a new Account within the calling Platform.
      #
      # @overload create(name:, brand_name: nil, organization: nil, time_zone: nil, request_options: {})
      #
      # @param name [String] The name of the account that will be visible for your internal organizational pu
      #
      # @param brand_name [String, nil] The name by which the people this account communicates with know it. If not prov
      #
      # @param organization [SurgeAPI::Models::AccountCreateParams::Organization] Parameters describing the legal entity on whose behalf the account will be opera
      #
      # @param time_zone [String] This is the time zone in which the account is headquartered. This time zone may
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::Account]
      #
      # @see SurgeAPI::Models::AccountCreateParams
      def create(params)
        parsed, options = SurgeAPI::AccountCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "accounts",
          body: parsed,
          model: SurgeAPI::Account,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::AccountUpdateParams} for more details.
      #
      # Updates an Account
      #
      # @overload update(id, brand_name: nil, name: nil, organization: nil, time_zone: nil, request_options: {})
      #
      # @param id [String] The ID for the account to update.
      #
      # @param brand_name [String] The name by which the people this account communicates with know it. If not prov
      #
      # @param name [String] The name of the account that will be visible for your internal organizational pu
      #
      # @param organization [SurgeAPI::Models::AccountUpdateParams::Organization] Parameters describing the legal entity on whose behalf the account will be opera
      #
      # @param time_zone [String, nil] The time zone for the account
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::Account]
      #
      # @see SurgeAPI::Models::AccountUpdateParams
      def update(id, params = {})
        parsed, options = SurgeAPI::AccountUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["accounts/%1$s", id],
          body: parsed,
          model: SurgeAPI::Account,
          options: options
        )
      end

      # Check an account's status and capabilities
      #
      # @overload retrieve_status(account_id, capabilities: nil, request_options: {})
      #
      # @param account_id [String] ID of the account to check
      #
      # @param capabilities [Array<Symbol, SurgeAPI::Models::AccountRetrieveStatusParams::Capability>] capabilities about which to check the status
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::AccountStatus]
      #
      # @see SurgeAPI::Models::AccountRetrieveStatusParams
      def retrieve_status(account_id, params = {})
        parsed, options = SurgeAPI::AccountRetrieveStatusParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["accounts/%1$s/status", account_id],
          query: parsed,
          model: SurgeAPI::AccountStatus,
          options: options
        )
      end

      # @api private
      #
      # @param client [SurgeAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
