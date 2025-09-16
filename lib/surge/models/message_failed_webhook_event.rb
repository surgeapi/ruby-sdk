# frozen_string_literal: true

module Surge
  module Models
    class MessageFailedWebhookEvent < Surge::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [Surge::Models::MessageFailedWebhookEvent::Data]
      required :data, -> { Surge::MessageFailedWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `message.failed` for this event.
      #
      #   @return [Symbol, Surge::Models::MessageFailedWebhookEvent::Type]
      required :type, enum: -> { Surge::MessageFailedWebhookEvent::Type }

      # @!method initialize(account_id:, data:, timestamp:, type:)
      #   The `message.failed` event is delivered whenever a message sent from your Surge
      #   number fails to be delivered.
      #
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [Surge::Models::MessageFailedWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, Surge::Models::MessageFailedWebhookEvent::Type] The type of the event. Always `message.failed` for this event.

      # @see Surge::Models::MessageFailedWebhookEvent#data
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
        #   @return [Surge::Models::MessageFailedWebhookEvent::Data::Conversation]
        required :conversation, -> { Surge::MessageFailedWebhookEvent::Data::Conversation }

        # @!attribute failed_at
        #   When the message failed
        #
        #   @return [Time]
        required :failed_at, Time

        # @!attribute failure_reason
        #   The reason the message failed to be delivered
        #
        #   @return [String]
        required :failure_reason, String

        # @!attribute attachments
        #   Attachments included with the message
        #
        #   @return [Array<Surge::Models::MessageFailedWebhookEvent::Data::Attachment>, nil]
        optional :attachments,
                 -> { Surge::Internal::Type::ArrayOf[Surge::MessageFailedWebhookEvent::Data::Attachment] }

        # @!method initialize(id:, body:, conversation:, failed_at:, failure_reason:, attachments: nil)
        #   The data associated with the event
        #
        #   @param id [String] The unique identifier for the message
        #
        #   @param body [String] The content of the message
        #
        #   @param conversation [Surge::Models::MessageFailedWebhookEvent::Data::Conversation] The conversation this message belongs to
        #
        #   @param failed_at [Time] When the message failed
        #
        #   @param failure_reason [String] The reason the message failed to be delivered
        #
        #   @param attachments [Array<Surge::Models::MessageFailedWebhookEvent::Data::Attachment>] Attachments included with the message

        # @see Surge::Models::MessageFailedWebhookEvent::Data#conversation
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
          #   @return [Symbol, Surge::Models::MessageFailedWebhookEvent::Data::Attachment::Type]
          required :type, enum: -> { Surge::MessageFailedWebhookEvent::Data::Attachment::Type }

          # @!attribute url
          #   The URL to download the attachment
          #
          #   @return [String]
          required :url, String

          # @!method initialize(id:, type:, url:)
          #   @param id [String] The unique identifier for the attachment
          #
          #   @param type [Symbol, Surge::Models::MessageFailedWebhookEvent::Data::Attachment::Type] The type of attachment
          #
          #   @param url [String] The URL to download the attachment

          # The type of attachment
          #
          # @see Surge::Models::MessageFailedWebhookEvent::Data::Attachment#type
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

      # The type of the event. Always `message.failed` for this event.
      #
      # @see Surge::Models::MessageFailedWebhookEvent#type
      module Type
        extend Surge::Internal::Type::Enum

        MESSAGE_FAILED = :"message.failed"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
