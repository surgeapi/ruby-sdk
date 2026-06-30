# frozen_string_literal: true

module SurgeAPI
  module Models
    # Payload for creating a message. Either an attachment or the body must be given.
    # You can specify the recipient either using the 'conversation' parameter or the
    # 'to'/'from' parameters, but not both.
    module MessageParams
      extend SurgeAPI::Internal::Type::Union

      # Create a message while including parameters for the conversation in which the message should be sent.
      variant -> { SurgeAPI::MessageParams::MessageParamsWithConversation }

      # Create a basic message by specifying just the to/from phone numbers.
      variant -> { SurgeAPI::MessageParams::SimpleMessageParams }

      class MessageParamsWithConversation < SurgeAPI::Internal::Type::BaseModel
        # @!attribute conversation
        #   Params for selecting or creating a new conversation. Either the id or the
        #   Contact must be given.
        #
        #   @return [SurgeAPI::Models::MessageParams::MessageParamsWithConversation::Conversation]
        required :conversation, -> { SurgeAPI::MessageParams::MessageParamsWithConversation::Conversation }

        # @!attribute attachments
        #
        #   @return [Array<SurgeAPI::Models::MessageParams::MessageParamsWithConversation::Attachment>, nil]
        optional :attachments,
                 -> { SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::MessageParams::MessageParamsWithConversation::Attachment] }

        # @!attribute body
        #   The message body.
        #
        #   @return [String, nil]
        optional :body, String

        # @!attribute metadata
        #   Set of key-value pairs that will be stored with the object.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, SurgeAPI::Internal::Type::HashOf[String]

        # @!attribute send_at
        #   An optional datetime for scheduling message up to a couple of months in the
        #   future.
        #
        #   @return [Time, nil]
        optional :send_at, Time

        # @!attribute settings
        #   Per-message setting overrides.
        #
        #   @return [SurgeAPI::Models::MessageParams::MessageParamsWithConversation::Settings, nil]
        optional :settings, -> { SurgeAPI::MessageParams::MessageParamsWithConversation::Settings }

        # @!method initialize(conversation:, attachments: nil, body: nil, metadata: nil, send_at: nil, settings: nil)
        #   Some parameter documentations has been truncated, see
        #   {SurgeAPI::Models::MessageParams::MessageParamsWithConversation} for more
        #   details.
        #
        #   Create a message while including parameters for the conversation in which the
        #   message should be sent.
        #
        #   @param conversation [SurgeAPI::Models::MessageParams::MessageParamsWithConversation::Conversation] Params for selecting or creating a new conversation. Either the id or the Contac
        #
        #   @param attachments [Array<SurgeAPI::Models::MessageParams::MessageParamsWithConversation::Attachment>]
        #
        #   @param body [String] The message body.
        #
        #   @param metadata [Hash{Symbol=>String}] Set of key-value pairs that will be stored with the object.
        #
        #   @param send_at [Time] An optional datetime for scheduling message up to a couple of months in the futu
        #
        #   @param settings [SurgeAPI::Models::MessageParams::MessageParamsWithConversation::Settings] Per-message setting overrides.

        # @see SurgeAPI::Models::MessageParams::MessageParamsWithConversation#conversation
        class Conversation < SurgeAPI::Internal::Type::BaseModel
          # @!attribute contact
          #   Parameters for creating a contact
          #
          #   @return [SurgeAPI::Models::MessageParams::MessageParamsWithConversation::Conversation::Contact]
          required :contact, -> { SurgeAPI::MessageParams::MessageParamsWithConversation::Conversation::Contact }

          # @!attribute phone_number
          #   The phone number from which to send the message. This can be either the phone
          #   number in E.164 format or a Surge phone number id.
          #
          #   @return [String, nil]
          optional :phone_number, String

          # @!method initialize(contact:, phone_number: nil)
          #   Some parameter documentations has been truncated, see
          #   {SurgeAPI::Models::MessageParams::MessageParamsWithConversation::Conversation}
          #   for more details.
          #
          #   Params for selecting or creating a new conversation. Either the id or the
          #   Contact must be given.
          #
          #   @param contact [SurgeAPI::Models::MessageParams::MessageParamsWithConversation::Conversation::Contact] Parameters for creating a contact
          #
          #   @param phone_number [String] The phone number from which to send the message. This can be either the phone nu

          # @see SurgeAPI::Models::MessageParams::MessageParamsWithConversation::Conversation#contact
          class Contact < SurgeAPI::Internal::Type::BaseModel
            # @!attribute phone_number
            #   The contact's phone number in E.164 format.
            #
            #   @return [String]
            required :phone_number, String

            # @!attribute email
            #   The contact's email address.
            #
            #   @return [String, nil]
            optional :email, String

            # @!attribute first_name
            #   The contact's first name.
            #
            #   @return [String, nil]
            optional :first_name, String

            # @!attribute last_name
            #   The contact's last name.
            #
            #   @return [String, nil]
            optional :last_name, String

            # @!attribute metadata
            #   Set of key-value pairs that will be stored with the object.
            #
            #   @return [Hash{Symbol=>String}, nil]
            optional :metadata, SurgeAPI::Internal::Type::HashOf[String]

            # @!method initialize(phone_number:, email: nil, first_name: nil, last_name: nil, metadata: nil)
            #   Parameters for creating a contact
            #
            #   @param phone_number [String] The contact's phone number in E.164 format.
            #
            #   @param email [String] The contact's email address.
            #
            #   @param first_name [String] The contact's first name.
            #
            #   @param last_name [String] The contact's last name.
            #
            #   @param metadata [Hash{Symbol=>String}] Set of key-value pairs that will be stored with the object.
          end
        end

        class Attachment < SurgeAPI::Internal::Type::BaseModel
          # @!attribute url
          #   The URL of the attachment.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(url:)
          #   Params for creating an attachment
          #
          #   @param url [String] The URL of the attachment.
        end

        # @see SurgeAPI::Models::MessageParams::MessageParamsWithConversation#settings
        class Settings < SurgeAPI::Internal::Type::BaseModel
          # @!attribute link_shortening
          #   Override link shortening for this message.
          #
          #   @return [Symbol, SurgeAPI::Models::MessageParams::MessageParamsWithConversation::Settings::LinkShortening, nil]
          optional :link_shortening,
                   enum: -> { SurgeAPI::MessageParams::MessageParamsWithConversation::Settings::LinkShortening }

          # @!method initialize(link_shortening: nil)
          #   Per-message setting overrides.
          #
          #   @param link_shortening [Symbol, SurgeAPI::Models::MessageParams::MessageParamsWithConversation::Settings::LinkShortening] Override link shortening for this message.

          # Override link shortening for this message.
          #
          # @see SurgeAPI::Models::MessageParams::MessageParamsWithConversation::Settings#link_shortening
          module LinkShortening
            extend SurgeAPI::Internal::Type::Enum

            ENABLED = :enabled
            DISABLED = :disabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      class SimpleMessageParams < SurgeAPI::Internal::Type::BaseModel
        # @!attribute to
        #   The recipient's phone number in E.164 format. Cannot be used together with
        #   'conversation'.
        #
        #   @return [String]
        required :to, String

        # @!attribute attachments
        #
        #   @return [Array<SurgeAPI::Models::MessageParams::SimpleMessageParams::Attachment>, nil]
        optional :attachments,
                 -> { SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::MessageParams::SimpleMessageParams::Attachment] }

        # @!attribute body
        #   The message body.
        #
        #   @return [String, nil]
        optional :body, String

        # @!attribute from
        #   The sender's phone number in E.164 format or phone number ID. If omitted, uses
        #   the account's default phone number. Cannot be used together with 'conversation'.
        #
        #   @return [String, nil]
        optional :from, String

        # @!attribute metadata
        #   Set of key-value pairs that will be stored with the object.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, SurgeAPI::Internal::Type::HashOf[String]

        # @!attribute send_at
        #   An optional datetime for scheduling message up to a couple of months in the
        #   future.
        #
        #   @return [Time, nil]
        optional :send_at, Time

        # @!attribute settings
        #   Per-message setting overrides.
        #
        #   @return [SurgeAPI::Models::MessageParams::SimpleMessageParams::Settings, nil]
        optional :settings, -> { SurgeAPI::MessageParams::SimpleMessageParams::Settings }

        # @!method initialize(to:, attachments: nil, body: nil, from: nil, metadata: nil, send_at: nil, settings: nil)
        #   Some parameter documentations has been truncated, see
        #   {SurgeAPI::Models::MessageParams::SimpleMessageParams} for more details.
        #
        #   Create a basic message by specifying just the to/from phone numbers.
        #
        #   @param to [String] The recipient's phone number in E.164 format. Cannot be used together with 'conv
        #
        #   @param attachments [Array<SurgeAPI::Models::MessageParams::SimpleMessageParams::Attachment>]
        #
        #   @param body [String] The message body.
        #
        #   @param from [String] The sender's phone number in E.164 format or phone number ID. If omitted, uses t
        #
        #   @param metadata [Hash{Symbol=>String}] Set of key-value pairs that will be stored with the object.
        #
        #   @param send_at [Time] An optional datetime for scheduling message up to a couple of months in the futu
        #
        #   @param settings [SurgeAPI::Models::MessageParams::SimpleMessageParams::Settings] Per-message setting overrides.

        class Attachment < SurgeAPI::Internal::Type::BaseModel
          # @!attribute url
          #   The URL of the attachment.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(url:)
          #   Params for creating an attachment
          #
          #   @param url [String] The URL of the attachment.
        end

        # @see SurgeAPI::Models::MessageParams::SimpleMessageParams#settings
        class Settings < SurgeAPI::Internal::Type::BaseModel
          # @!attribute link_shortening
          #   Override link shortening for this message.
          #
          #   @return [Symbol, SurgeAPI::Models::MessageParams::SimpleMessageParams::Settings::LinkShortening, nil]
          optional :link_shortening,
                   enum: -> { SurgeAPI::MessageParams::SimpleMessageParams::Settings::LinkShortening }

          # @!method initialize(link_shortening: nil)
          #   Per-message setting overrides.
          #
          #   @param link_shortening [Symbol, SurgeAPI::Models::MessageParams::SimpleMessageParams::Settings::LinkShortening] Override link shortening for this message.

          # Override link shortening for this message.
          #
          # @see SurgeAPI::Models::MessageParams::SimpleMessageParams::Settings#link_shortening
          module LinkShortening
            extend SurgeAPI::Internal::Type::Enum

            ENABLED = :enabled
            DISABLED = :disabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # @!method self.variants
      #   @return [Array(SurgeAPI::Models::MessageParams::MessageParamsWithConversation, SurgeAPI::Models::MessageParams::SimpleMessageParams)]
    end
  end
end
