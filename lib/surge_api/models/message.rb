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

      # @!attribute blast_id
      #   The ID of the blast this message belongs to, if any. This can be used to
      #   attribute messages back to a specific blast.
      #
      #   @return [String, nil]
      optional :blast_id, String

      # @!attribute body
      #   The message body.
      #
      #   @return [String, nil]
      optional :body, String, nil?: true

      # @!attribute conversation
      #   A conversation with a Contact
      #
      #   @return [SurgeAPI::Models::Message::Conversation, nil]
      optional :conversation, -> { SurgeAPI::Message::Conversation }

      # @!attribute metadata
      #   Set of key-value pairs that will be stored with the object.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, SurgeAPI::Internal::Type::HashOf[String]

      # @!method initialize(id: nil, attachments: nil, blast_id: nil, body: nil, conversation: nil, metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::Message} for more details.
      #
      #   A Message is a communication sent to a Contact.
      #
      #   @param id [String] Unique identifier for the object.
      #
      #   @param attachments [Array<SurgeAPI::Models::Message::Attachment>]
      #
      #   @param blast_id [String] The ID of the blast this message belongs to, if any. This can be used to attribu
      #
      #   @param body [String, nil] The message body.
      #
      #   @param conversation [SurgeAPI::Models::Message::Conversation] A conversation with a Contact
      #
      #   @param metadata [Hash{Symbol=>String}] Set of key-value pairs that will be stored with the object.

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
