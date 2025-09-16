# frozen_string_literal: true

module Surge
  module Models
    class MessageDeliveredWebhookEvent < Surge::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [Surge::Models::MessageDeliveredWebhookEvent::Data]
      required :data, -> { Surge::MessageDeliveredWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `message.delivered` for this event.
      #
      #   @return [Symbol, Surge::Models::MessageDeliveredWebhookEvent::Type]
      required :type, enum: -> { Surge::MessageDeliveredWebhookEvent::Type }

      # @!method initialize(account_id:, data:, timestamp:, type:)
      #   The `message.delivered` event is delivered whenever a message sent from a Surge
      #   number is successfully delivered to the recipient. When the message is sent from
      #   a short code or toll-free number, this means that the message arrived on the
      #   recipient's device. When sent from a local number, this means that the message
      #   was successfully handed off to the recipient's mobile carrier, but does not
      #   guarantee that it arrived on the recipient's device.
      #
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [Surge::Models::MessageDeliveredWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, Surge::Models::MessageDeliveredWebhookEvent::Type] The type of the event. Always `message.delivered` for this event.

      # @see Surge::Models::MessageDeliveredWebhookEvent#data
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
        #   @return [Surge::Models::MessageDeliveredWebhookEvent::Data::Conversation]
        required :conversation, -> { Surge::MessageDeliveredWebhookEvent::Data::Conversation }

        # @!attribute delivered_at
        #   When the message was delivered
        #
        #   @return [Time]
        required :delivered_at, Time

        # @!attribute attachments
        #   Attachments included with the message
        #
        #   @return [Array<Surge::Models::MessageDeliveredWebhookEvent::Data::Attachment>, nil]
        optional :attachments,
                 -> { Surge::Internal::Type::ArrayOf[Surge::MessageDeliveredWebhookEvent::Data::Attachment] }

        # @!method initialize(id:, body:, conversation:, delivered_at:, attachments: nil)
        #   The data associated with the event
        #
        #   @param id [String] The unique identifier for the message
        #
        #   @param body [String] The content of the message
        #
        #   @param conversation [Surge::Models::MessageDeliveredWebhookEvent::Data::Conversation] The conversation this message belongs to
        #
        #   @param delivered_at [Time] When the message was delivered
        #
        #   @param attachments [Array<Surge::Models::MessageDeliveredWebhookEvent::Data::Attachment>] Attachments included with the message

        # @see Surge::Models::MessageDeliveredWebhookEvent::Data#conversation
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
          #   @return [Symbol, Surge::Models::MessageDeliveredWebhookEvent::Data::Attachment::Type]
          required :type, enum: -> { Surge::MessageDeliveredWebhookEvent::Data::Attachment::Type }

          # @!attribute url
          #   The URL where the attachment can be downloaded
          #
          #   @return [String]
          required :url, String

          # @!method initialize(id:, type:, url:)
          #   @param id [String] The unique identifier for the attachment
          #
          #   @param type [Symbol, Surge::Models::MessageDeliveredWebhookEvent::Data::Attachment::Type] The type of attachment
          #
          #   @param url [String] The URL where the attachment can be downloaded

          # The type of attachment
          #
          # @see Surge::Models::MessageDeliveredWebhookEvent::Data::Attachment#type
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

      # The type of the event. Always `message.delivered` for this event.
      #
      # @see Surge::Models::MessageDeliveredWebhookEvent#type
      module Type
        extend Surge::Internal::Type::Enum

        MESSAGE_DELIVERED = :"message.delivered"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
