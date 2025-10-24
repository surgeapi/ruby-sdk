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

      # Payload for creating a message. Either an attachment or the body must be given.
      # You can specify the recipient either using the 'conversation' parameter or the
      # 'to'/'from' parameters, but not both.
      sig do
        returns(
          T.any(
            SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation,
            SurgeAPI::MessageCreateParams::Params::SimpleMessageParams
          )
        )
      end
      attr_accessor :params

      sig do
        params(
          params:
            T.any(
              SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::OrHash,
              SurgeAPI::MessageCreateParams::Params::SimpleMessageParams::OrHash
            ),
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Payload for creating a message. Either an attachment or the body must be given.
        # You can specify the recipient either using the 'conversation' parameter or the
        # 'to'/'from' parameters, but not both.
        params:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            params:
              T.any(
                SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation,
                SurgeAPI::MessageCreateParams::Params::SimpleMessageParams
              ),
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Payload for creating a message. Either an attachment or the body must be given.
      # You can specify the recipient either using the 'conversation' parameter or the
      # 'to'/'from' parameters, but not both.
      module Params
        extend SurgeAPI::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation,
              SurgeAPI::MessageCreateParams::Params::SimpleMessageParams
            )
          end

        class MessageParamsWithConversation < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation,
                SurgeAPI::Internal::AnyHash
              )
            end

          # Params for selecting or creating a new conversation. Either the id or the
          # Contact must be given.
          sig do
            returns(
              SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Conversation
            )
          end
          attr_reader :conversation

          sig do
            params(
              conversation:
                SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Conversation::OrHash
            ).void
          end
          attr_writer :conversation

          sig do
            returns(
              T.nilable(
                T::Array[
                  SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Attachment
                ]
              )
            )
          end
          attr_reader :attachments

          sig do
            params(
              attachments:
                T::Array[
                  SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Attachment::OrHash
                ]
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

          # Create a message while including parameters for the conversation in which the
          # message should be sent.
          sig do
            params(
              conversation:
                SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Conversation::OrHash,
              attachments:
                T::Array[
                  SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Attachment::OrHash
                ],
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
                  SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Conversation,
                attachments:
                  T::Array[
                    SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Attachment
                  ],
                body: String,
                send_at: Time
              }
            )
          end
          def to_hash
          end

          class Conversation < SurgeAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Conversation,
                  SurgeAPI::Internal::AnyHash
                )
              end

            # Parameters for creating a contact
            sig do
              returns(
                SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Conversation::Contact
              )
            end
            attr_reader :contact

            sig do
              params(
                contact:
                  SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Conversation::Contact::OrHash
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
                  SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Conversation::Contact::OrHash,
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
                  contact:
                    SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Conversation::Contact,
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
                    SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Conversation::Contact,
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
                  SurgeAPI::MessageCreateParams::Params::MessageParamsWithConversation::Attachment,
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

        class SimpleMessageParams < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::MessageCreateParams::Params::SimpleMessageParams,
                SurgeAPI::Internal::AnyHash
              )
            end

          # The recipient's phone number in E.164 format. Cannot be used together with
          # 'conversation'.
          sig { returns(String) }
          attr_accessor :to

          sig do
            returns(
              T.nilable(
                T::Array[
                  SurgeAPI::MessageCreateParams::Params::SimpleMessageParams::Attachment
                ]
              )
            )
          end
          attr_reader :attachments

          sig do
            params(
              attachments:
                T::Array[
                  SurgeAPI::MessageCreateParams::Params::SimpleMessageParams::Attachment::OrHash
                ]
            ).void
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
              attachments:
                T::Array[
                  SurgeAPI::MessageCreateParams::Params::SimpleMessageParams::Attachment::OrHash
                ],
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
                attachments:
                  T::Array[
                    SurgeAPI::MessageCreateParams::Params::SimpleMessageParams::Attachment
                  ],
                body: String,
                from: String,
                send_at: Time
              }
            )
          end
          def to_hash
          end

          class Attachment < SurgeAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  SurgeAPI::MessageCreateParams::Params::SimpleMessageParams::Attachment,
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

        sig do
          override.returns(
            T::Array[SurgeAPI::MessageCreateParams::Params::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
