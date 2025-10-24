# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Messages#create
    class MessageCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute params
      #   Payload for creating a message. Either an attachment or the body must be given.
      #   You can specify the recipient either using the 'conversation' parameter or the
      #   'to'/'from' parameters, but not both.
      #
      #   @return [SurgeAPI::Models::MessageCreateParams::Params::MessageParamsWithConversation, SurgeAPI::Models::MessageCreateParams::Params::SimpleMessageParams]
      required :params, union: -> { SurgeAPI::MessageCreateParams::Params }

      # @!method initialize(params:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::MessageCreateParams} for more details.
      #
      #   @param params [SurgeAPI::Models::MessageCreateParams::Params::MessageParamsWithConversation, SurgeAPI::Models::MessageCreateParams::Params::SimpleMessageParams] Payload for creating a message. Either an attachment or the body must be given.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]

      # Payload for creating a message. Either an attachment or the body must be given.
      # You can specify the recipient either using the 'conversation' parameter or the
      # 'to'/'from' parameters, but not both.
      module Params
        extend SurgeAPI::Internal::Type::Union

        # Create a message while including parameters for the conversation in which the message should be sent.
        variant -> { SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation }

        # Create a basic message by specifying just the to/from phone numbers.
        variant -> { SurgeAPI::MessageCreateParams::Params::SimpleMessageParams }

        class MessageParamsWithConversation < SurgeAPI::Internal::Type::BaseModel
          # @!attribute conversation
          #   Params for selecting or creating a new conversation. Either the id or the
          #   Contact must be given.
          #
          #   @return [SurgeAPI::Models::MessageCreateParams::Params::MessageParamsWithConversation::Conversation]
          required :conversation,
                   -> { SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Conversation }

          # @!attribute attachments
          #
          #   @return [Array<SurgeAPI::Models::MessageCreateParams::Params::MessageParamsWithConversation::Attachment>, nil]
          optional :attachments,
                   -> { SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Attachment] }

          # @!attribute body
          #   The message body.
          #
          #   @return [String, nil]
          optional :body, String

          # @!attribute send_at
          #   An optional datetime for scheduling message up to a couple of months in the
          #   future.
          #
          #   @return [Time, nil]
          optional :send_at, Time

          # @!method initialize(conversation:, attachments: nil, body: nil, send_at: nil)
          #   Some parameter documentations has been truncated, see
          #   {SurgeAPI::Models::MessageCreateParams::Params::MessageParamsWithConversation}
          #   for more details.
          #
          #   Create a message while including parameters for the conversation in which the
          #   message should be sent.
          #
          #   @param conversation [SurgeAPI::Models::MessageCreateParams::Params::MessageParamsWithConversation::Conversation] Params for selecting or creating a new conversation. Either the id or the Contac
          #
          #   @param attachments [Array<SurgeAPI::Models::MessageCreateParams::Params::MessageParamsWithConversation::Attachment>]
          #
          #   @param body [String] The message body.
          #
          #   @param send_at [Time] An optional datetime for scheduling message up to a couple of months in the futu

          # @see SurgeAPI::Models::MessageCreateParams::Params::MessageParamsWithConversation#conversation
          class Conversation < SurgeAPI::Internal::Type::BaseModel
            # @!attribute contact
            #   Parameters for creating a contact
            #
            #   @return [SurgeAPI::Models::MessageCreateParams::Params::MessageParamsWithConversation::Conversation::Contact]
            required :contact,
                     -> { SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Conversation::Contact }

            # @!attribute phone_number
            #   The phone number from which to send the message. This can be either the phone
            #   number in E.164 format or a Surge phone number id.
            #
            #   @return [String, nil]
            optional :phone_number, String

            # @!method initialize(contact:, phone_number: nil)
            #   Some parameter documentations has been truncated, see
            #   {SurgeAPI::Models::MessageCreateParams::Params::MessageParamsWithConversation::Conversation}
            #   for more details.
            #
            #   Params for selecting or creating a new conversation. Either the id or the
            #   Contact must be given.
            #
            #   @param contact [SurgeAPI::Models::MessageCreateParams::Params::MessageParamsWithConversation::Conversation::Contact] Parameters for creating a contact
            #
            #   @param phone_number [String] The phone number from which to send the message. This can be either the phone nu

            # @see SurgeAPI::Models::MessageCreateParams::Params::MessageParamsWithConversation::Conversation#contact
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
          #   @return [Array<SurgeAPI::Models::MessageCreateParams::Params::SimpleMessageParams::Attachment>, nil]
          optional :attachments,
                   -> { SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::MessageCreateParams::Params::SimpleMessageParams::Attachment] }

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

          # @!attribute send_at
          #   An optional datetime for scheduling message up to a couple of months in the
          #   future.
          #
          #   @return [Time, nil]
          optional :send_at, Time

          # @!method initialize(to:, attachments: nil, body: nil, from: nil, send_at: nil)
          #   Some parameter documentations has been truncated, see
          #   {SurgeAPI::Models::MessageCreateParams::Params::SimpleMessageParams} for more
          #   details.
          #
          #   Create a basic message by specifying just the to/from phone numbers.
          #
          #   @param to [String] The recipient's phone number in E.164 format. Cannot be used together with 'conv
          #
          #   @param attachments [Array<SurgeAPI::Models::MessageCreateParams::Params::SimpleMessageParams::Attachment>]
          #
          #   @param body [String] The message body.
          #
          #   @param from [String] The sender's phone number in E.164 format or phone number ID. If omitted, uses t
          #
          #   @param send_at [Time] An optional datetime for scheduling message up to a couple of months in the futu

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
        end

        # @!method self.variants
        #   @return [Array(SurgeAPI::Models::MessageCreateParams::Params::MessageParamsWithConversation, SurgeAPI::Models::MessageCreateParams::Params::SimpleMessageParams)]
      end
    end
  end
end
