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
        #   @return [Array<SurgeAPI::Models::AttachmentParams>, nil]
        optional :attachments, -> { SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::AttachmentParams] }

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
        #   {SurgeAPI::Models::MessageParams::MessageParamsWithConversation} for more
        #   details.
        #
        #   Create a message while including parameters for the conversation in which the
        #   message should be sent.
        #
        #   @param conversation [SurgeAPI::Models::MessageParams::MessageParamsWithConversation::Conversation] Params for selecting or creating a new conversation. Either the id or the Contac
        #
        #   @param attachments [Array<SurgeAPI::Models::AttachmentParams>]
        #
        #   @param body [String] The message body.
        #
        #   @param send_at [Time] An optional datetime for scheduling message up to a couple of months in the futu

        # @see SurgeAPI::Models::MessageParams::MessageParamsWithConversation#conversation
        class Conversation < SurgeAPI::Internal::Type::BaseModel
          # @!attribute contact
          #   Parameters for creating a contact
          #
          #   @return [SurgeAPI::Models::ContactParams]
          required :contact, -> { SurgeAPI::ContactParams }

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
          #   @param contact [SurgeAPI::Models::ContactParams] Parameters for creating a contact
          #
          #   @param phone_number [String] The phone number from which to send the message. This can be either the phone nu
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
        #   @return [Array<SurgeAPI::Models::AttachmentParams>, nil]
        optional :attachments, -> { SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::AttachmentParams] }

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
        #   {SurgeAPI::Models::MessageParams::SimpleMessageParams} for more details.
        #
        #   Create a basic message by specifying just the to/from phone numbers.
        #
        #   @param to [String] The recipient's phone number in E.164 format. Cannot be used together with 'conv
        #
        #   @param attachments [Array<SurgeAPI::Models::AttachmentParams>]
        #
        #   @param body [String] The message body.
        #
        #   @param from [String] The sender's phone number in E.164 format or phone number ID. If omitted, uses t
        #
        #   @param send_at [Time] An optional datetime for scheduling message up to a couple of months in the futu
      end

      # @!method self.variants
      #   @return [Array(SurgeAPI::Models::MessageParams::MessageParamsWithConversation, SurgeAPI::Models::MessageParams::SimpleMessageParams)]
    end
  end
end
