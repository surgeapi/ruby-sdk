# frozen_string_literal: true

module Surge
  module Models
    class ConversationCreatedWebhookEvent < Surge::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [Surge::Models::ConversationCreatedWebhookEvent::Data]
      required :data, -> { Surge::ConversationCreatedWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `conversation.created` for this event.
      #
      #   @return [Symbol, Surge::Models::ConversationCreatedWebhookEvent::Type]
      required :type, enum: -> { Surge::ConversationCreatedWebhookEvent::Type }

      # @!method initialize(account_id:, data:, timestamp:, type:)
      #   The `conversation.created` event is delivered whenever a new conversation is
      #   started with a contact. This could be when either the contact sends a message to
      #   your Surge number or when you create a conversation, whether by sending an
      #   initial message to the contact or by manually creating the conversation using
      #   the API.
      #
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [Surge::Models::ConversationCreatedWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, Surge::Models::ConversationCreatedWebhookEvent::Type] The type of the event. Always `conversation.created` for this event.

      # @see Surge::Models::ConversationCreatedWebhookEvent#data
      class Data < Surge::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the conversation
        #
        #   @return [String]
        required :id, String

        # @!attribute contact
        #   A contact who has consented to receive messages
        #
        #   @return [Surge::Models::Contact]
        required :contact, -> { Surge::Contact }

        # @!attribute phone_number
        #   A phone number that can be used to send and receive messages and calls
        #
        #   @return [Surge::Models::PhoneNumber]
        required :phone_number, -> { Surge::PhoneNumber }

        # @!method initialize(id:, contact:, phone_number:)
        #   The data associated with the event
        #
        #   @param id [String] The unique identifier for the conversation
        #
        #   @param contact [Surge::Models::Contact] A contact who has consented to receive messages
        #
        #   @param phone_number [Surge::Models::PhoneNumber] A phone number that can be used to send and receive messages and calls
      end

      # The type of the event. Always `conversation.created` for this event.
      #
      # @see Surge::Models::ConversationCreatedWebhookEvent#type
      module Type
        extend Surge::Internal::Type::Enum

        CONVERSATION_CREATED = :"conversation.created"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
