# frozen_string_literal: true

module SurgeAPI
  module Models
    class MessageDeliveredWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [SurgeAPI::Models::MessageDeliveredWebhookEvent::Data]
      required :data, -> { SurgeAPI::MessageDeliveredWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `message.delivered` for this event.
      #
      #   @return [Symbol, :"message.delivered"]
      required :type, const: :"message.delivered"

      # @!method initialize(account_id:, data:, timestamp:, type: :"message.delivered")
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [SurgeAPI::Models::MessageDeliveredWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, :"message.delivered"] The type of the event. Always `message.delivered` for this event.

      # @see SurgeAPI::Models::MessageDeliveredWebhookEvent#data
      class Data < SurgeAPI::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the message
        #
        #   @return [String]
        required :id, String

        # @!attribute body
        #   The content of the message
        #
        #   @return [String, nil]
        required :body, String, nil?: true

        # @!attribute conversation
        #   The conversation this message belongs to
        #
        #   @return [SurgeAPI::Models::MessageDeliveredWebhookEvent::Data::Conversation]
        required :conversation, -> { SurgeAPI::MessageDeliveredWebhookEvent::Data::Conversation }

        # @!attribute delivered_at
        #   When the message was delivered
        #
        #   @return [Time]
        required :delivered_at, Time

        # @!attribute attachments
        #   Attachments included with the message
        #
        #   @return [Array<SurgeAPI::Models::MessageDeliveredWebhookEvent::Data::Attachment>, nil]
        optional :attachments,
                 -> { SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment] }

        # @!attribute blast_id
        #   The ID of the blast this message belongs to, if any. This can be used to
        #   attribute messages back to a specific blast.
        #
        #   @return [String, nil]
        optional :blast_id, String

        # @!method initialize(id:, body:, conversation:, delivered_at:, attachments: nil, blast_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {SurgeAPI::Models::MessageDeliveredWebhookEvent::Data} for more details.
        #
        #   The data associated with the event
        #
        #   @param id [String] The unique identifier for the message
        #
        #   @param body [String, nil] The content of the message
        #
        #   @param conversation [SurgeAPI::Models::MessageDeliveredWebhookEvent::Data::Conversation] The conversation this message belongs to
        #
        #   @param delivered_at [Time] When the message was delivered
        #
        #   @param attachments [Array<SurgeAPI::Models::MessageDeliveredWebhookEvent::Data::Attachment>] Attachments included with the message
        #
        #   @param blast_id [String] The ID of the blast this message belongs to, if any. This can be used to attribu

        # @see SurgeAPI::Models::MessageDeliveredWebhookEvent::Data#conversation
        class Conversation < SurgeAPI::Internal::Type::BaseModel
          # @!attribute id
          #   The unique identifier for the conversation
          #
          #   @return [String]
          required :id, String

          # @!attribute contact
          #   A contact who has consented to receive messages
          #
          #   @return [SurgeAPI::Models::Contact]
          required :contact, -> { SurgeAPI::Contact }

          # @!attribute phone_number
          #   A phone number that can be used to send and receive messages and calls
          #
          #   @return [SurgeAPI::Models::PhoneNumber]
          required :phone_number, -> { SurgeAPI::PhoneNumber }

          # @!method initialize(id:, contact:, phone_number:)
          #   The conversation this message belongs to
          #
          #   @param id [String] The unique identifier for the conversation
          #
          #   @param contact [SurgeAPI::Models::Contact] A contact who has consented to receive messages
          #
          #   @param phone_number [SurgeAPI::Models::PhoneNumber] A phone number that can be used to send and receive messages and calls
        end

        class Attachment < SurgeAPI::Internal::Type::BaseModel
          # @!attribute id
          #   The unique identifier for the attachment
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #   The type of attachment
          #
          #   @return [Symbol, SurgeAPI::Models::MessageDeliveredWebhookEvent::Data::Attachment::Type]
          required :type, enum: -> { SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment::Type }

          # @!attribute url
          #   The URL where the attachment can be downloaded
          #
          #   @return [String]
          required :url, String

          # @!method initialize(id:, type:, url:)
          #   @param id [String] The unique identifier for the attachment
          #
          #   @param type [Symbol, SurgeAPI::Models::MessageDeliveredWebhookEvent::Data::Attachment::Type] The type of attachment
          #
          #   @param url [String] The URL where the attachment can be downloaded

          # The type of attachment
          #
          # @see SurgeAPI::Models::MessageDeliveredWebhookEvent::Data::Attachment#type
          module Type
            extend SurgeAPI::Internal::Type::Enum

            FILE = :file
            IMAGE = :image
            LINK = :link
            VIDEO = :video

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
