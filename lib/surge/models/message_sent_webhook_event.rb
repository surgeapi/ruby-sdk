# frozen_string_literal: true

module Surge
  module Models
    class MessageSentWebhookEvent < Surge::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [Surge::Models::MessageSentWebhookEvent::Data]
      required :data, -> { Surge::MessageSentWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `message.sent` for this event.
      #
      #   @return [Symbol, Surge::Models::MessageSentWebhookEvent::Type]
      required :type, enum: -> { Surge::MessageSentWebhookEvent::Type }

      # @!method initialize(account_id:, data:, timestamp:, type:)
      #   The `message.sent` event is delivered whenever a message is sent from a Surge
      #   number to a contact.
      #
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [Surge::Models::MessageSentWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, Surge::Models::MessageSentWebhookEvent::Type] The type of the event. Always `message.sent` for this event.

      # @see Surge::Models::MessageSentWebhookEvent#data
      class Data < Surge::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the message
        #
        #   @return [String]
        required :id, String

        # @!attribute body
        #   The content of the message
        #
        #   @return [String]
        required :body, String

        # @!attribute conversation
        #   The conversation this message belongs to
        #
        #   @return [Surge::Models::MessageSentWebhookEvent::Data::Conversation]
        required :conversation, -> { Surge::MessageSentWebhookEvent::Data::Conversation }

        # @!attribute sent_at
        #   When the message was sent
        #
        #   @return [Time]
        required :sent_at, Time

        # @!attribute attachments
        #   Attachments included with the message
        #
        #   @return [Array<Surge::Models::MessageSentWebhookEvent::Data::Attachment>, nil]
        optional :attachments,
                 -> { Surge::Internal::Type::ArrayOf[Surge::MessageSentWebhookEvent::Data::Attachment] }

        # @!method initialize(id:, body:, conversation:, sent_at:, attachments: nil)
        #   The data associated with the event
        #
        #   @param id [String] The unique identifier for the message
        #
        #   @param body [String] The content of the message
        #
        #   @param conversation [Surge::Models::MessageSentWebhookEvent::Data::Conversation] The conversation this message belongs to
        #
        #   @param sent_at [Time] When the message was sent
        #
        #   @param attachments [Array<Surge::Models::MessageSentWebhookEvent::Data::Attachment>] Attachments included with the message

        # @see Surge::Models::MessageSentWebhookEvent::Data#conversation
        class Conversation < Surge::Internal::Type::BaseModel
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
          #   The conversation this message belongs to
          #
          #   @param id [String] The unique identifier for the conversation
          #
          #   @param contact [Surge::Models::Contact] A contact who has consented to receive messages
          #
          #   @param phone_number [Surge::Models::PhoneNumber] A phone number that can be used to send and receive messages and calls
        end

        class Attachment < Surge::Internal::Type::BaseModel
          # @!attribute id
          #   The unique identifier for the attachment
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #   The type of attachment
          #
          #   @return [Symbol, Surge::Models::MessageSentWebhookEvent::Data::Attachment::Type]
          required :type, enum: -> { Surge::MessageSentWebhookEvent::Data::Attachment::Type }

          # @!attribute url
          #   The URL to download the attachment
          #
          #   @return [String]
          required :url, String

          # @!method initialize(id:, type:, url:)
          #   @param id [String] The unique identifier for the attachment
          #
          #   @param type [Symbol, Surge::Models::MessageSentWebhookEvent::Data::Attachment::Type] The type of attachment
          #
          #   @param url [String] The URL to download the attachment

          # The type of attachment
          #
          # @see Surge::Models::MessageSentWebhookEvent::Data::Attachment#type
          module Type
            extend Surge::Internal::Type::Enum

            FILE = :file
            IMAGE = :image
            LINK = :link
            VIDEO = :video

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # The type of the event. Always `message.sent` for this event.
      #
      # @see Surge::Models::MessageSentWebhookEvent#type
      module Type
        extend Surge::Internal::Type::Enum

        MESSAGE_SENT = :"message.sent"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
