# frozen_string_literal: true

module SurgeAPI
  module Resources
    class Audiences
      # Creates a new audience.
      #
      # @overload create(account_id, name:, request_options: {})
      #
      # @param account_id [String] The account for which the audience should be created.
      #
      # @param name [String] The audience name.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::AudienceCreateResponse]
      #
      # @see SurgeAPI::Models::AudienceCreateParams
      def create(account_id, params)
        parsed, options = SurgeAPI::AudienceCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["accounts/%1$s/audiences", account_id],
          body: parsed,
          model: SurgeAPI::Models::AudienceCreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::AudienceAddContactParams} for more details.
      #
      # Adds an existing contact to a manual audience.
      #
      # @overload add_contact(audience_id, id:, request_options: {})
      #
      # @param audience_id [String] The audience ID to add the contact to.
      #
      # @param id [String] The ID of the contact to add. The contact must belong to the same account as the
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::Contact]
      #
      # @see SurgeAPI::Models::AudienceAddContactParams
      def add_contact(audience_id, params)
        parsed, options = SurgeAPI::AudienceAddContactParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["audiences/%1$s/contacts", audience_id],
          body: parsed,
          model: SurgeAPI::Contact,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::AudienceListContactsParams} for more details.
      #
      # List all contacts in an audience with cursor-based pagination. The account is
      # inferred from the audience.
      #
      # @overload list_contacts(audience_id, after: nil, before: nil, request_options: {})
      #
      # @param audience_id [String] The audience ID to list contacts for.
      #
      # @param after [String] Cursor for forward pagination. Use the next_cursor from a previous response.
      #
      # @param before [String] Cursor for backward pagination. Use the previous_cursor from a previous response
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Internal::Cursor<SurgeAPI::Models::Contact>]
      #
      # @see SurgeAPI::Models::AudienceListContactsParams
      def list_contacts(audience_id, params = {})
        parsed, options = SurgeAPI::AudienceListContactsParams.dump_request(params)
        query = SurgeAPI::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["audiences/%1$s/contacts", audience_id],
          query: query,
          page: SurgeAPI::Internal::Cursor,
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
