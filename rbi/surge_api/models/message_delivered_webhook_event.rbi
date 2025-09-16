# typed: strong

module SurgeAPI
  module Models
    class MessageDeliveredWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::MessageDeliveredWebhookEvent,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The ID of the account in which this event occurred
      sig { returns(String) }
      attr_accessor :account_id

      # The data associated with the event
      sig { returns(SurgeAPI::MessageDeliveredWebhookEvent::Data) }
      attr_reader :data

      sig do
        params(data: SurgeAPI::MessageDeliveredWebhookEvent::Data::OrHash).void
      end
      attr_writer :data

      # The timestamp when this event occurred, in ISO8601 format
      sig { returns(Time) }
      attr_accessor :timestamp

      # The type of the event. Always `message.delivered` for this event.
      sig do
        returns(SurgeAPI::MessageDeliveredWebhookEvent::Type::TaggedSymbol)
      end
      attr_accessor :type

      # The `message.delivered` event is delivered whenever a message sent from a Surge
      # number is successfully delivered to the recipient. When the message is sent from
      # a short code or toll-free number, this means that the message arrived on the
      # recipient's device. When sent from a local number, this means that the message
      # was successfully handed off to the recipient's mobile carrier, but does not
      # guarantee that it arrived on the recipient's device.
      sig do
        params(
          account_id: String,
          data: SurgeAPI::MessageDeliveredWebhookEvent::Data::OrHash,
          timestamp: Time,
          type: SurgeAPI::MessageDeliveredWebhookEvent::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the account in which this event occurred
        account_id:,
        # The data associated with the event
        data:,
        # The timestamp when this event occurred, in ISO8601 format
        timestamp:,
        # The type of the event. Always `message.delivered` for this event.
        type:
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            data: SurgeAPI::MessageDeliveredWebhookEvent::Data,
            timestamp: Time,
            type: SurgeAPI::MessageDeliveredWebhookEvent::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Data < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::MessageDeliveredWebhookEvent::Data,
              SurgeAPI::Internal::AnyHash
            )
          end

        # The unique identifier for the message
        sig { returns(String) }
        attr_accessor :id

        # The content of the message
        sig { returns(String) }
        attr_accessor :body

        # The conversation this message belongs to
        sig do
          returns(SurgeAPI::MessageDeliveredWebhookEvent::Data::Conversation)
        end
        attr_reader :conversation

        sig do
          params(
            conversation:
              SurgeAPI::MessageDeliveredWebhookEvent::Data::Conversation::OrHash
          ).void
        end
        attr_writer :conversation

        # When the message was delivered
        sig { returns(Time) }
        attr_accessor :delivered_at

        # Attachments included with the message
        sig do
          returns(
            T.nilable(
              T::Array[SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment]
            )
          )
        end
        attr_reader :attachments

        sig do
          params(
            attachments:
              T::Array[
                SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment::OrHash
              ]
          ).void
        end
        attr_writer :attachments

        # The data associated with the event
        sig do
          params(
            id: String,
            body: String,
            conversation:
              SurgeAPI::MessageDeliveredWebhookEvent::Data::Conversation::OrHash,
            delivered_at: Time,
            attachments:
              T::Array[
                SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # The unique identifier for the message
          id:,
          # The content of the message
          body:,
          # The conversation this message belongs to
          conversation:,
          # When the message was delivered
          delivered_at:,
          # Attachments included with the message
          attachments: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              body: String,
              conversation:
                SurgeAPI::MessageDeliveredWebhookEvent::Data::Conversation,
              delivered_at: Time,
              attachments:
                T::Array[
                  SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment
                ]
            }
          )
        end
        def to_hash
        end

        class Conversation < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::MessageDeliveredWebhookEvent::Data::Conversation,
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
                SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment,
                SurgeAPI::Internal::AnyHash
              )
            end

          # The unique identifier for the attachment
          sig { returns(String) }
          attr_accessor :id

          # The type of attachment
          sig do
            returns(
              SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The URL where the attachment can be downloaded
          sig { returns(String) }
          attr_accessor :url

          sig do
            params(
              id: String,
              type:
                SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment::Type::OrSymbol,
              url: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The unique identifier for the attachment
            id:,
            # The type of attachment
            type:,
            # The URL where the attachment can be downloaded
            url:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                type:
                  SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment::Type::TaggedSymbol,
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
                  SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FILE =
              T.let(
                :file,
                SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment::Type::TaggedSymbol
              )
            IMAGE =
              T.let(
                :image,
                SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment::Type::TaggedSymbol
              )
            LINK =
              T.let(
                :link,
                SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment::Type::TaggedSymbol
              )
            VIDEO =
              T.let(
                :video,
                SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::MessageDeliveredWebhookEvent::Data::Attachment::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      # The type of the event. Always `message.delivered` for this event.
      module Type
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, SurgeAPI::MessageDeliveredWebhookEvent::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MESSAGE_DELIVERED =
          T.let(
            :"message.delivered",
            SurgeAPI::MessageDeliveredWebhookEvent::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[SurgeAPI::MessageDeliveredWebhookEvent::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
