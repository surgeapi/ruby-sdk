# typed: strong

module SurgeAPI
  module Resources
    class Audiences
      # Adds an existing contact to a manual audience.
      sig do
        params(
          audience_id: String,
          id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Contact)
      end
      def add_contact(
        # The audience ID to add the contact to.
        audience_id,
        # The ID of the contact to add. The contact must belong to the same account as the
        # audience.
        id:,
        request_options: {}
      )
      end

      # List all contacts in an audience with cursor-based pagination. The account is
      # inferred from the audience.
      sig do
        params(
          audience_id: String,
          after: String,
          before: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Internal::Cursor[SurgeAPI::Contact])
      end
      def list_contacts(
        # The audience ID to list contacts for.
        audience_id,
        # Cursor for forward pagination. Use the next_cursor from a previous response.
        after: nil,
        # Cursor for backward pagination. Use the previous_cursor from a previous
        # response.
        before: nil,
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
