# frozen_string_literal: true

module SurgeAPI
  module Resources
    class Contacts
      # Creates a new Contact object.
      #
      # @overload create(account_id, phone_number:, email: nil, first_name: nil, last_name: nil, metadata: nil, request_options: {})
      #
      # @param account_id [String] The account for which the contact should be created.
      #
      # @param phone_number [String] The contact's phone number in E.164 format.
      #
      # @param email [String] The contact's email address.
      #
      # @param first_name [String] The contact's first name.
      #
      # @param last_name [String] The contact's last name.
      #
      # @param metadata [Hash{Symbol=>String}] Set of key-value pairs that will be stored with the object.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::Contact]
      #
      # @see SurgeAPI::Models::ContactCreateParams
      def create(account_id, params)
        parsed, options = SurgeAPI::ContactCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["accounts/%1$s/contacts", account_id],
          body: parsed,
          model: SurgeAPI::Contact,
          options: options
        )
      end

      # Retrieves a Contact object.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] The ID of the contact to retrieve.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::Contact]
      #
      # @see SurgeAPI::Models::ContactRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["contacts/%1$s", id],
          model: SurgeAPI::Contact,
          options: params[:request_options]
        )
      end

      # Updates the specified contact by setting the values of the parameters passed.
      # Any parameters not provided will be left unchanged.
      #
      # @overload update(id, phone_number:, email: nil, first_name: nil, last_name: nil, metadata: nil, request_options: {})
      #
      # @param id [String] The ID of the contact to update.
      #
      # @param phone_number [String] The contact's phone number in E.164 format.
      #
      # @param email [String] The contact's email address.
      #
      # @param first_name [String] The contact's first name.
      #
      # @param last_name [String] The contact's last name.
      #
      # @param metadata [Hash{Symbol=>String}] Set of key-value pairs that will be stored with the object.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::Contact]
      #
      # @see SurgeAPI::Models::ContactUpdateParams
      def update(id, params)
        parsed, options = SurgeAPI::ContactUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["contacts/%1$s", id],
          body: parsed,
          model: SurgeAPI::Contact,
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
