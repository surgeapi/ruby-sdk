# typed: strong

module SurgeAPI
  module Resources
    class Contacts
      # Creates a new Contact object.
      sig do
        params(
          account_id: String,
          phone_number: String,
          email: String,
          first_name: String,
          last_name: String,
          metadata: T::Hash[Symbol, String],
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Contact)
      end
      def create(
        # The account for which the contact should be created.
        account_id,
        # The contact's phone number in E.164 format.
        phone_number:,
        # The contact's email address.
        email: nil,
        # The contact's first name.
        first_name: nil,
        # The contact's last name.
        last_name: nil,
        # Set of key-value pairs that will be stored with the object.
        metadata: nil,
        request_options: {}
      )
      end

      # Retrieves a Contact object.
      sig do
        params(
          id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Contact)
      end
      def retrieve(
        # The ID of the contact to retrieve.
        id,
        request_options: {}
      )
      end

      # Updates the specified contact by setting the values of the parameters passed.
      # Any parameters not provided will be left unchanged.
      sig do
        params(
          id: String,
          phone_number: String,
          email: String,
          first_name: String,
          last_name: String,
          metadata: T::Hash[Symbol, String],
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Contact)
      end
      def update(
        # The ID of the contact to update.
        id,
        # The contact's phone number in E.164 format.
        phone_number:,
        # The contact's email address.
        email: nil,
        # The contact's first name.
        first_name: nil,
        # The contact's last name.
        last_name: nil,
        # Set of key-value pairs that will be stored with the object.
        metadata: nil,
        request_options: {}
      )
      end

      # List all contacts for an account with cursor-based pagination.
      sig do
        params(
          account_id: String,
          after: String,
          before: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Internal::Cursor[SurgeAPI::Contact])
      end
      def list(
        # The account ID to list contacts for.
        account_id,
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
