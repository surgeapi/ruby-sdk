# typed: strong

module SurgeAPI
  module Resources
    class Audiences
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
