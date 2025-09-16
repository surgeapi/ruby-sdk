# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Messages#create
    class Message < SurgeAPI::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the object.
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute attachments
      #
      #   @return [Array<SurgeAPI::Models::Message::Attachment>, nil]
      optional :attachments, -> { SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::Message::Attachment] }

      # @!attribute body
      #   The message body.
      #
      #   @return [String, nil]
      optional :body, String

      # @!attribute conversation
      #   A conversation with a Contact
      #
      #   @return [SurgeAPI::Models::Message::Conversation, nil]
      optional :conversation, -> { SurgeAPI::Message::Conversation }

      # @!method initialize(id: nil, attachments: nil, body: nil, conversation: nil)
      #   A Message is a communication sent to a Contact.
      #
      #   @param id [String] Unique identifier for the object.
      #
      #   @param attachments [Array<SurgeAPI::Models::Message::Attachment>]
      #
      #   @param body [String] The message body.
      #
      #   @param conversation [SurgeAPI::Models::Message::Conversation] A conversation with a Contact

      class Attachment < SurgeAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for the object.
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute type
        #   The type of attachment.
        #
        #   @return [String, nil]
        optional :type, String

        # @!attribute url
        #   The URL of the attachment.
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(id: nil, type: nil, url: nil)
        #   An Attachment is a file that can be sent with a message.
        #
        #   @param id [String] Unique identifier for the object.
        #
        #   @param type [String] The type of attachment.
        #
        #   @param url [String] The URL of the attachment.
      end

      # @see SurgeAPI::Models::Message#conversation
      class Conversation < SurgeAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for the object.
        #
        #   @return [String]
        required :id, String

        # @!attribute contact
        #   A contact who has consented to receive messages
        #
        #   @return [SurgeAPI::Models::Contact]
        required :contact, -> { SurgeAPI::Contact }

        # @!attribute phone_number
        #   This is the phone number tied to the Surge account.
        #
        #   @return [SurgeAPI::Models::Message::Conversation::PhoneNumber, nil]
        optional :phone_number, -> { SurgeAPI::Message::Conversation::PhoneNumber }

        # @!method initialize(id:, contact:, phone_number: nil)
        #   A conversation with a Contact
        #
        #   @param id [String] Unique identifier for the object.
        #
        #   @param contact [SurgeAPI::Models::Contact] A contact who has consented to receive messages
        #
        #   @param phone_number [SurgeAPI::Models::Message::Conversation::PhoneNumber] This is the phone number tied to the Surge account.

        # @see SurgeAPI::Models::Message::Conversation#phone_number
        class PhoneNumber < SurgeAPI::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for the phone number
          #
          #   @return [String]
          required :id, String

          # @!attribute number
          #   The canonical format of the phone number.
          #
          #   @return [String]
          required :number, String

          # @!attribute type
          #   Whether the phone number is local, toll-free, or short code
          #
          #   @return [Symbol, SurgeAPI::Models::Message::Conversation::PhoneNumber::Type]
          required :type, enum: -> { SurgeAPI::Message::Conversation::PhoneNumber::Type }

          # @!method initialize(id:, number:, type:)
          #   This is the phone number tied to the Surge account.
          #
          #   @param id [String] Unique identifier for the phone number
          #
          #   @param number [String] The canonical format of the phone number.
          #
          #   @param type [Symbol, SurgeAPI::Models::Message::Conversation::PhoneNumber::Type] Whether the phone number is local, toll-free, or short code

          # Whether the phone number is local, toll-free, or short code
          #
          # @see SurgeAPI::Models::Message::Conversation::PhoneNumber#type
          module Type
            extend SurgeAPI::Internal::Type::Enum

            LOCAL = :local
            TOLL_FREE = :toll_free
            SHORT_CODE = :short_code
            DEMO = :demo

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
