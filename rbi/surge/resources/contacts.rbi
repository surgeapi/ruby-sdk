# typed: strong

module Surge
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
          request_options: Surge::RequestOptions::OrHash
        ).returns(Surge::Contact)
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
          request_options: Surge::RequestOptions::OrHash
        ).returns(Surge::Contact)
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
          request_options: Surge::RequestOptions::OrHash
        ).returns(Surge::Contact)
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

      # @api private
      sig { params(client: Surge::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
