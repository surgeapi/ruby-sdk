# typed: strong

module SurgeAPI
  module Models
    class PhoneNumberImportedWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::PhoneNumberImportedWebhookEvent,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The ID of the account in which this event occurred
      sig { returns(String) }
      attr_accessor :account_id

      # The data associated with the event
      sig { returns(SurgeAPI::PhoneNumberImportedWebhookEvent::Data) }
      attr_reader :data

      sig do
        params(
          data: SurgeAPI::PhoneNumberImportedWebhookEvent::Data::OrHash
        ).void
      end
      attr_writer :data

      # The timestamp when this event occurred, in ISO8601 format
      sig { returns(Time) }
      attr_accessor :timestamp

      # The type of the event. Always `phone_number.imported` for this event.
      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          account_id: String,
          data: SurgeAPI::PhoneNumberImportedWebhookEvent::Data::OrHash,
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
        # The type of the event. Always `phone_number.imported` for this event.
        type: :"phone_number.imported"
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            data: SurgeAPI::PhoneNumberImportedWebhookEvent::Data,
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
              SurgeAPI::PhoneNumberImportedWebhookEvent::Data,
              SurgeAPI::Internal::AnyHash
            )
          end

        # The unique identifier for the phone number
        sig { returns(String) }
        attr_accessor :id

        # Campaign attachment details for a domestic local phone number
        sig do
          returns(
            T.nilable(SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign)
          )
        end
        attr_reader :campaign

        sig do
          params(
            campaign:
              T.nilable(
                SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign::OrHash
              )
          ).void
        end
        attr_writer :campaign

        # Deprecated. The unique identifier of the campaign this phone number is attached
        # to
        sig { returns(T.nilable(String)) }
        attr_accessor :campaign_id

        # A human-readable name for the phone number
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # The phone number in E.164 format
        sig { returns(String) }
        attr_accessor :number

        # Whether the phone number is local, toll-free, or short code
        sig do
          returns(
            SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The data associated with the event
        sig do
          params(
            id: String,
            campaign:
              T.nilable(
                SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign::OrHash
              ),
            campaign_id: T.nilable(String),
            name: T.nilable(String),
            number: String,
            type:
              SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The unique identifier for the phone number
          id:,
          # Campaign attachment details for a domestic local phone number
          campaign:,
          # Deprecated. The unique identifier of the campaign this phone number is attached
          # to
          campaign_id:,
          # A human-readable name for the phone number
          name:,
          # The phone number in E.164 format
          number:,
          # Whether the phone number is local, toll-free, or short code
          type:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              campaign:
                T.nilable(
                  SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign
                ),
              campaign_id: T.nilable(String),
              name: T.nilable(String),
              number: String,
              type:
                SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        class Campaign < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign,
                SurgeAPI::Internal::AnyHash
              )
            end

          # The unique identifier of the campaign this phone number is attached to
          sig { returns(String) }
          attr_accessor :id

          # The current campaign attachment status for this phone number.
          sig do
            returns(
              SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign::AttachmentStatus::TaggedSymbol
            )
          end
          attr_accessor :attachment_status

          # Campaign attachment details for a domestic local phone number
          sig do
            params(
              id: String,
              attachment_status:
                SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign::AttachmentStatus::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The unique identifier of the campaign this phone number is attached to
            id:,
            # The current campaign attachment status for this phone number.
            attachment_status:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                attachment_status:
                  SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign::AttachmentStatus::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # The current campaign attachment status for this phone number.
          module AttachmentStatus
            extend SurgeAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign::AttachmentStatus
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ATTACHED =
              T.let(
                :attached,
                SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign::AttachmentStatus::TaggedSymbol
              )
            ATTACHMENT_PENDING =
              T.let(
                :attachment_pending,
                SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign::AttachmentStatus::TaggedSymbol
              )
            DETACHED =
              T.let(
                :detached,
                SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign::AttachmentStatus::TaggedSymbol
              )
            DETACHMENT_PENDING =
              T.let(
                :detachment_pending,
                SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign::AttachmentStatus::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Campaign::AttachmentStatus::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        # Whether the phone number is local, toll-free, or short code
        module Type
          extend SurgeAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LOCAL =
            T.let(
              :local,
              SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Type::TaggedSymbol
            )
          SHORT_CODE =
            T.let(
              :short_code,
              SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Type::TaggedSymbol
            )
          TOLL_FREE =
            T.let(
              :toll_free,
              SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::PhoneNumberImportedWebhookEvent::Data::Type::TaggedSymbol
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
