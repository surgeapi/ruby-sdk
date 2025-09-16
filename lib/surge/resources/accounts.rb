# frozen_string_literal: true

module Surge
  module Resources
    class Accounts
      # Some parameter documentations has been truncated, see
      # {Surge::Models::AccountCreateParams} for more details.
      #
      # Creates a new Account within the calling Platform.
      #
      # @overload create(name:, brand_name: nil, organization: nil, time_zone: nil, request_options: {})
      #
      # @param name [String] The name of the account that will be visible for your internal organizational pu
      #
      # @param brand_name [String, nil] The name by which the people this account communicates with know it. If not prov
      #
      # @param organization [Surge::Models::OrganizationParams] Parameters describing the legal entity on whose behalf the account will be opera
      #
      # @param time_zone [String] This is the time zone in which the account is headquartered. This time zone may
      #
      # @param request_options [Surge::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Surge::Models::Account]
      #
      # @see Surge::Models::AccountCreateParams
      def create(params)
        parsed, options = Surge::AccountCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "accounts",
          body: parsed,
          model: Surge::Account,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Surge::Models::AccountUpdateParams} for more details.
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
      # @param organization [Surge::Models::OrganizationParams] Parameters describing the legal entity on whose behalf the account will be opera
      #
      # @param time_zone [String, nil] The time zone for the account
      #
      # @param request_options [Surge::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Surge::Models::Account]
      #
      # @see Surge::Models::AccountUpdateParams
      def update(id, params = {})
        parsed, options = Surge::AccountUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["accounts/%1$s", id],
          body: parsed,
          model: Surge::Account,
          options: options
        )
      end

      # Check an account's status and capabilities
      #
      # @overload retrieve_status(account_id, capabilities: nil, request_options: {})
      #
      # @param account_id [String] ID of the account to check
      #
      # @param capabilities [Array<Symbol, Surge::Models::AccountRetrieveStatusParams::Capability>]
      #
      # @param request_options [Surge::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Surge::Models::AccountStatus]
      #
      # @see Surge::Models::AccountRetrieveStatusParams
      def retrieve_status(account_id, params = {})
        parsed, options = Surge::AccountRetrieveStatusParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["accounts/%1$s/status", account_id],
          query: parsed,
          model: Surge::AccountStatus,
          options: options
        )
      end

      # @api private
      #
      # @param client [Surge::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
