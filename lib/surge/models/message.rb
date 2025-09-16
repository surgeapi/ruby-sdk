# frozen_string_literal: true

module Surge
  module Models
    # @see Surge::Resources::Messages#create
    class Message < Surge::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the object.
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute attachments
      #
      #   @return [Array<Surge::Models::Message::Attachment>, nil]
      optional :attachments, -> { Surge::Internal::Type::ArrayOf[Surge::Message::Attachment] }

      # @!attribute body
      #   The message body.
      #
      #   @return [String, nil]
      optional :body, String

      # @!attribute conversation
      #   A conversation with a Contact
      #
      #   @return [Surge::Models::Message::Conversation, nil]
      optional :conversation, -> { Surge::Message::Conversation }

      # @!method initialize(id: nil, attachments: nil, body: nil, conversation: nil)
      #   A Message is a communication sent to a Contact.
      #
      #   @param id [String] Unique identifier for the object.
      #
      #   @param attachments [Array<Surge::Models::Message::Attachment>]
      #
      #   @param body [String] The message body.
      #
      #   @param conversation [Surge::Models::Message::Conversation] A conversation with a Contact

      class Attachment < Surge::Internal::Type::BaseModel
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

      # @see Surge::Models::Message#conversation
      class Conversation < Surge::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for the object.
        #
        #   @return [String]
        required :id, String

        # @!attribute contact
        #   A contact who has consented to receive messages
        #
        #   @return [Surge::Models::Contact]
        required :contact, -> { Surge::Contact }

        # @!attribute phone_number
        #   This is the phone number tied to the Surge account.
        #
        #   @return [Surge::Models::Message::Conversation::PhoneNumber, nil]
        optional :phone_number, -> { Surge::Message::Conversation::PhoneNumber }

        # @!method initialize(id:, contact:, phone_number: nil)
        #   A conversation with a Contact
        #
        #   @param id [String] Unique identifier for the object.
        #
        #   @param contact [Surge::Models::Contact] A contact who has consented to receive messages
        #
        #   @param phone_number [Surge::Models::Message::Conversation::PhoneNumber] This is the phone number tied to the Surge account.

        # @see Surge::Models::Message::Conversation#phone_number
        class PhoneNumber < Surge::Internal::Type::BaseModel
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
          #   @return [Symbol, Surge::Models::Message::Conversation::PhoneNumber::Type]
          required :type, enum: -> { Surge::Message::Conversation::PhoneNumber::Type }

          # @!method initialize(id:, number:, type:)
          #   This is the phone number tied to the Surge account.
          #
          #   @param id [String] Unique identifier for the phone number
          #
          #   @param number [String] The canonical format of the phone number.
          #
          #   @param type [Symbol, Surge::Models::Message::Conversation::PhoneNumber::Type] Whether the phone number is local, toll-free, or short code

          # Whether the phone number is local, toll-free, or short code
          #
          # @see Surge::Models::Message::Conversation::PhoneNumber#type
          module Type
            extend Surge::Internal::Type::Enum

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
