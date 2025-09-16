# typed: strong

module Surge
  module Models
    # Payload for creating a message. Either an attachment or the body must be given.
    # You can specify the recipient either using the 'conversation' parameter or the
    # 'to'/'from' parameters, but not both.
    module MessageParams
      extend Surge::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Surge::MessageParams::MessageParamsWithConversation,
            Surge::MessageParams::SimpleMessageParams
          )
        end

      class MessageParamsWithConversation < Surge::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Surge::MessageParams::MessageParamsWithConversation,
              Surge::Internal::AnyHash
            )
          end

        # Params for selecting or creating a new conversation. Either the id or the
        # Contact must be given.
        sig do
          returns(
            Surge::MessageParams::MessageParamsWithConversation::Conversation
          )
        end
        attr_reader :conversation

        sig do
          params(
            conversation:
              Surge::MessageParams::MessageParamsWithConversation::Conversation::OrHash
          ).void
        end
        attr_writer :conversation

        sig { returns(T.nilable(T::Array[Surge::AttachmentParams])) }
        attr_reader :attachments

        sig do
          params(attachments: T::Array[Surge::AttachmentParams::OrHash]).void
        end
        attr_writer :attachments

        # The message body.
        sig { returns(T.nilable(String)) }
        attr_reader :body

        sig { params(body: String).void }
        attr_writer :body

        # An optional datetime for scheduling message up to a couple of months in the
        # future.
        sig { returns(T.nilable(Time)) }
        attr_reader :send_at

        sig { params(send_at: Time).void }
        attr_writer :send_at

        # Create a message while including parameters for the conversation in which the
        # message should be sent.
        sig do
          params(
            conversation:
              Surge::MessageParams::MessageParamsWithConversation::Conversation::OrHash,
            attachments: T::Array[Surge::AttachmentParams::OrHash],
            body: String,
            send_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # Params for selecting or creating a new conversation. Either the id or the
          # Contact must be given.
          conversation:,
          attachments: nil,
          # The message body.
          body: nil,
          # An optional datetime for scheduling message up to a couple of months in the
          # future.
          send_at: nil
        )
        end

        sig do
          override.returns(
            {
              conversation:
                Surge::MessageParams::MessageParamsWithConversation::Conversation,
              attachments: T::Array[Surge::AttachmentParams],
              body: String,
              send_at: Time
            }
          )
        end
        def to_hash
        end

        class Conversation < Surge::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Surge::MessageParams::MessageParamsWithConversation::Conversation,
                Surge::Internal::AnyHash
              )
            end

          # Parameters for creating a contact
          sig { returns(Surge::ContactParams) }
          attr_reader :contact

          sig { params(contact: Surge::ContactParams::OrHash).void }
          attr_writer :contact

          # The phone number from which to send the message. This can be either the phone
          # number in E.164 format or a Surge phone number id.
          sig { returns(T.nilable(String)) }
          attr_reader :phone_number

          sig { params(phone_number: String).void }
          attr_writer :phone_number

          # Params for selecting or creating a new conversation. Either the id or the
          # Contact must be given.
          sig do
            params(
              contact: Surge::ContactParams::OrHash,
              phone_number: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Parameters for creating a contact
            contact:,
            # The phone number from which to send the message. This can be either the phone
            # number in E.164 format or a Surge phone number id.
            phone_number: nil
          )
          end

          sig do
            override.returns(
              { contact: Surge::ContactParams, phone_number: String }
            )
          end
          def to_hash
          end
        end
      end

      class SimpleMessageParams < Surge::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Surge::MessageParams::SimpleMessageParams,
              Surge::Internal::AnyHash
            )
          end

        # The recipient's phone number in E.164 format. Cannot be used together with
        # 'conversation'.
        sig { returns(String) }
        attr_accessor :to

        sig { returns(T.nilable(T::Array[Surge::AttachmentParams])) }
        attr_reader :attachments

        sig do
          params(attachments: T::Array[Surge::AttachmentParams::OrHash]).void
        end
        attr_writer :attachments

        # The message body.
        sig { returns(T.nilable(String)) }
        attr_reader :body

        sig { params(body: String).void }
        attr_writer :body

        # The sender's phone number in E.164 format or phone number ID. If omitted, uses
        # the account's default phone number. Cannot be used together with 'conversation'.
        sig { returns(T.nilable(String)) }
        attr_reader :from

        sig { params(from: String).void }
        attr_writer :from

        # An optional datetime for scheduling message up to a couple of months in the
        # future.
        sig { returns(T.nilable(Time)) }
        attr_reader :send_at

        sig { params(send_at: Time).void }
        attr_writer :send_at

        # Create a basic message by specifying just the to/from phone numbers.
        sig do
          params(
            to: String,
            attachments: T::Array[Surge::AttachmentParams::OrHash],
            body: String,
            from: String,
            send_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # The recipient's phone number in E.164 format. Cannot be used together with
          # 'conversation'.
          to:,
          attachments: nil,
          # The message body.
          body: nil,
          # The sender's phone number in E.164 format or phone number ID. If omitted, uses
          # the account's default phone number. Cannot be used together with 'conversation'.
          from: nil,
          # An optional datetime for scheduling message up to a couple of months in the
          # future.
          send_at: nil
        )
        end

        sig do
          override.returns(
            {
              to: String,
              attachments: T::Array[Surge::AttachmentParams],
              body: String,
              from: String,
              send_at: Time
            }
          )
        end
        def to_hash
        end
      end

      sig { override.returns(T::Array[Surge::MessageParams::Variants]) }
      def self.variants
      end
    end
  end
end
