# typed: strong

module SurgeAPI
  module Models
    class MessageFailedWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::MessageFailedWebhookEvent,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The ID of the account in which this event occurred
      sig { returns(String) }
      attr_accessor :account_id

      # The data associated with the event
      sig { returns(SurgeAPI::MessageFailedWebhookEvent::Data) }
      attr_reader :data

      sig do
        params(data: SurgeAPI::MessageFailedWebhookEvent::Data::OrHash).void
      end
      attr_writer :data

      # The timestamp when this event occurred, in ISO8601 format
      sig { returns(Time) }
      attr_accessor :timestamp

      # The type of the event. Always `message.failed` for this event.
      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          account_id: String,
          data: SurgeAPI::MessageFailedWebhookEvent::Data::OrHash,
          timestamp: Time,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the account in which this event occurred
        account_id:,
        # The data associated with the event
        data:,
        # The timestamp when this event occurred, in ISO8601 format
        timestamp:,
        # The type of the event. Always `message.failed` for this event.
        type: :"message.failed"
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            data: SurgeAPI::MessageFailedWebhookEvent::Data,
            timestamp: Time,
            type: Symbol
          }
        )
      end
      def to_hash
      end

      class Data < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::MessageFailedWebhookEvent::Data,
              SurgeAPI::Internal::AnyHash
            )
          end

        # The unique identifier for the message
        sig { returns(String) }
        attr_accessor :id

        # The content of the message
        sig { returns(T.nilable(String)) }
        attr_accessor :body

        # The conversation this message belongs to
        sig { returns(SurgeAPI::MessageFailedWebhookEvent::Data::Conversation) }
        attr_reader :conversation

        sig do
          params(
            conversation:
              SurgeAPI::MessageFailedWebhookEvent::Data::Conversation::OrHash
          ).void
        end
        attr_writer :conversation

        # When the message failed
        sig { returns(Time) }
        attr_accessor :failed_at

        # The reason the message failed to be delivered
        sig { returns(String) }
        attr_accessor :failure_reason

        # Attachments included with the message
        sig do
          returns(
            T.nilable(
              T::Array[SurgeAPI::MessageFailedWebhookEvent::Data::Attachment]
            )
          )
        end
        attr_reader :attachments

        sig do
          params(
            attachments:
              T::Array[
                SurgeAPI::MessageFailedWebhookEvent::Data::Attachment::OrHash
              ]
          ).void
        end
        attr_writer :attachments

        # The ID of the blast this message belongs to, if any. This can be used to
        # attribute messages back to a specific blast.
        sig { returns(T.nilable(String)) }
        attr_reader :blast_id

        sig { params(blast_id: String).void }
        attr_writer :blast_id

        # The data associated with the event
        sig do
          params(
            id: String,
            body: T.nilable(String),
            conversation:
              SurgeAPI::MessageFailedWebhookEvent::Data::Conversation::OrHash,
            failed_at: Time,
            failure_reason: String,
            attachments:
              T::Array[
                SurgeAPI::MessageFailedWebhookEvent::Data::Attachment::OrHash
              ],
            blast_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The unique identifier for the message
          id:,
          # The content of the message
          body:,
          # The conversation this message belongs to
          conversation:,
          # When the message failed
          failed_at:,
          # The reason the message failed to be delivered
          failure_reason:,
          # Attachments included with the message
          attachments: nil,
          # The ID of the blast this message belongs to, if any. This can be used to
          # attribute messages back to a specific blast.
          blast_id: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              body: T.nilable(String),
              conversation:
                SurgeAPI::MessageFailedWebhookEvent::Data::Conversation,
              failed_at: Time,
              failure_reason: String,
              attachments:
                T::Array[SurgeAPI::MessageFailedWebhookEvent::Data::Attachment],
              blast_id: String
            }
          )
        end
        def to_hash
        end

        class Conversation < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::MessageFailedWebhookEvent::Data::Conversation,
                SurgeAPI::Internal::AnyHash
              )
            end

          # The unique identifier for the conversation
          sig { returns(String) }
          attr_accessor :id

          # A contact who has consented to receive messages
          sig { returns(SurgeAPI::Contact) }
          attr_reader :contact

          sig { params(contact: SurgeAPI::Contact::OrHash).void }
          attr_writer :contact

          # A phone number that can be used to send and receive messages and calls
          sig { returns(SurgeAPI::PhoneNumber) }
          attr_reader :phone_number

          sig { params(phone_number: SurgeAPI::PhoneNumber::OrHash).void }
          attr_writer :phone_number

          # The conversation this message belongs to
          sig do
            params(
              id: String,
              contact: SurgeAPI::Contact::OrHash,
              phone_number: SurgeAPI::PhoneNumber::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The unique identifier for the conversation
            id:,
            # A contact who has consented to receive messages
            contact:,
            # A phone number that can be used to send and receive messages and calls
            phone_number:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                contact: SurgeAPI::Contact,
                phone_number: SurgeAPI::PhoneNumber
              }
            )
          end
          def to_hash
          end
        end

        class Attachment < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::MessageFailedWebhookEvent::Data::Attachment,
                SurgeAPI::Internal::AnyHash
              )
            end

          # The unique identifier for the attachment
          sig { returns(String) }
          attr_accessor :id

          # The type of attachment
          sig do
            returns(
              SurgeAPI::MessageFailedWebhookEvent::Data::Attachment::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The URL to download the attachment
          sig { returns(String) }
          attr_accessor :url

          sig do
            params(
              id: String,
              type:
                SurgeAPI::MessageFailedWebhookEvent::Data::Attachment::Type::OrSymbol,
              url: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The unique identifier for the attachment
            id:,
            # The type of attachment
            type:,
            # The URL to download the attachment
            url:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                type:
                  SurgeAPI::MessageFailedWebhookEvent::Data::Attachment::Type::TaggedSymbol,
                url: String
              }
            )
          end
          def to_hash
          end

          # The type of attachment
          module Type
            extend SurgeAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  SurgeAPI::MessageFailedWebhookEvent::Data::Attachment::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FILE =
              T.let(
                :file,
                SurgeAPI::MessageFailedWebhookEvent::Data::Attachment::Type::TaggedSymbol
              )
            IMAGE =
              T.let(
                :image,
                SurgeAPI::MessageFailedWebhookEvent::Data::Attachment::Type::TaggedSymbol
              )
            LINK =
              T.let(
                :link,
                SurgeAPI::MessageFailedWebhookEvent::Data::Attachment::Type::TaggedSymbol
              )
            VIDEO =
              T.let(
                :video,
                SurgeAPI::MessageFailedWebhookEvent::Data::Attachment::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::MessageFailedWebhookEvent::Data::Attachment::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
