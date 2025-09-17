# typed: strong

module SurgeAPI
  module Models
    class MessageCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::MessageCreateParams, SurgeAPI::Internal::AnyHash)
        end

      # Params for selecting or creating a new conversation. Either the id or the
      # Contact must be given.
      sig { returns(SurgeAPI::MessageCreateParams::Conversation) }
      attr_reader :conversation

      sig do
        params(
          conversation: SurgeAPI::MessageCreateParams::Conversation::OrHash
        ).void
      end
      attr_writer :conversation

      sig do
        returns(T.nilable(T::Array[SurgeAPI::MessageCreateParams::Attachment]))
      end
      attr_reader :attachments

      sig do
        params(
          attachments:
            T::Array[SurgeAPI::MessageCreateParams::Attachment::OrHash]
        ).void
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

      # The recipient's phone number in E.164 format. Cannot be used together with
      # 'conversation'.
      sig { returns(String) }
      attr_accessor :to

      # The sender's phone number in E.164 format or phone number ID. If omitted, uses
      # the account's default phone number. Cannot be used together with 'conversation'.
      sig { returns(T.nilable(String)) }
      attr_reader :from

      sig { params(from: String).void }
      attr_writer :from

      sig do
        params(
          conversation: SurgeAPI::MessageCreateParams::Conversation::OrHash,
          to: String,
          attachments:
            T::Array[SurgeAPI::MessageCreateParams::Attachment::OrHash],
          body: String,
          send_at: Time,
          from: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Params for selecting or creating a new conversation. Either the id or the
        # Contact must be given.
        conversation:,
        # The recipient's phone number in E.164 format. Cannot be used together with
        # 'conversation'.
        to:,
        attachments: nil,
        # The message body.
        body: nil,
        # An optional datetime for scheduling message up to a couple of months in the
        # future.
        send_at: nil,
        # The sender's phone number in E.164 format or phone number ID. If omitted, uses
        # the account's default phone number. Cannot be used together with 'conversation'.
        from: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            conversation: SurgeAPI::MessageCreateParams::Conversation,
            attachments: T::Array[SurgeAPI::MessageCreateParams::Attachment],
            body: String,
            send_at: Time,
            to: String,
            from: String,
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Conversation < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::MessageCreateParams::Conversation,
              SurgeAPI::Internal::AnyHash
            )
          end

        # Parameters for creating a contact
        sig { returns(SurgeAPI::MessageCreateParams::Conversation::Contact) }
        attr_reader :contact

        sig do
          params(
            contact:
              SurgeAPI::MessageCreateParams::Conversation::Contact::OrHash
          ).void
        end
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
            contact:
              SurgeAPI::MessageCreateParams::Conversation::Contact::OrHash,
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
            {
              contact: SurgeAPI::MessageCreateParams::Conversation::Contact,
              phone_number: String
            }
          )
        end
        def to_hash
        end

        class Contact < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::MessageCreateParams::Conversation::Contact,
                SurgeAPI::Internal::AnyHash
              )
            end

          # The contact's phone number in E.164 format.
          sig { returns(String) }
          attr_accessor :phone_number

          # The contact's email address.
          sig { returns(T.nilable(String)) }
          attr_reader :email

          sig { params(email: String).void }
          attr_writer :email

          # The contact's first name.
          sig { returns(T.nilable(String)) }
          attr_reader :first_name

          sig { params(first_name: String).void }
          attr_writer :first_name

          # The contact's last name.
          sig { returns(T.nilable(String)) }
          attr_reader :last_name

          sig { params(last_name: String).void }
          attr_writer :last_name

          # Set of key-value pairs that will be stored with the object.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :metadata

          sig { params(metadata: T::Hash[Symbol, String]).void }
          attr_writer :metadata

          # Parameters for creating a contact
          sig do
            params(
              phone_number: String,
              email: String,
              first_name: String,
              last_name: String,
              metadata: T::Hash[Symbol, String]
            ).returns(T.attached_class)
          end
          def self.new(
            # The contact's phone number in E.164 format.
            phone_number:,
            # The contact's email address.
            email: nil,
            # The contact's first name.
            first_name: nil,
            # The contact's last name.
            last_name: nil,
            # Set of key-value pairs that will be stored with the object.
            metadata: nil
          )
          end

          sig do
            override.returns(
              {
                phone_number: String,
                email: String,
                first_name: String,
                last_name: String,
                metadata: T::Hash[Symbol, String]
              }
            )
          end
          def to_hash
          end
        end
      end

      class Attachment < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::MessageCreateParams::Attachment,
              SurgeAPI::Internal::AnyHash
            )
          end

        # The URL of the attachment.
        sig { returns(String) }
        attr_accessor :url

        # Params for creating an attachment
        sig { params(url: String).returns(T.attached_class) }
        def self.new(
          # The URL of the attachment.
          url:
        )
        end

        sig { override.returns({ url: String }) }
        def to_hash
        end
      end
    end
  end
end
