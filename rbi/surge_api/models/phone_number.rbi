# typed: strong

module SurgeAPI
  module Models
    class PhoneNumber < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SurgeAPI::PhoneNumber, SurgeAPI::Internal::AnyHash)
        end

      # Unique identifier for the phone number
      sig { returns(String) }
      attr_accessor :id

      # Campaign attachment details for a domestic local phone number
      sig { returns(T.nilable(SurgeAPI::PhoneNumber::Campaign)) }
      attr_reader :campaign

      sig do
        params(
          campaign: T.nilable(SurgeAPI::PhoneNumber::Campaign::OrHash)
        ).void
      end
      attr_writer :campaign

      # Deprecated. The unique identifier of the campaign this phone number is attached
      # to, if any
      sig { returns(T.nilable(String)) }
      attr_accessor :campaign_id

      # A human-readable name for the phone number
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # The phone number in E.164 format
      sig { returns(String) }
      attr_accessor :number

      # Whether the phone number is local, toll-free, or short code
      sig { returns(SurgeAPI::PhoneNumber::Type::TaggedSymbol) }
      attr_accessor :type

      # A phone number that can be used to send and receive messages and calls
      sig do
        params(
          id: String,
          campaign: T.nilable(SurgeAPI::PhoneNumber::Campaign::OrHash),
          campaign_id: T.nilable(String),
          name: T.nilable(String),
          number: String,
          type: SurgeAPI::PhoneNumber::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the phone number
        id:,
        # Campaign attachment details for a domestic local phone number
        campaign:,
        # Deprecated. The unique identifier of the campaign this phone number is attached
        # to, if any
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
            campaign: T.nilable(SurgeAPI::PhoneNumber::Campaign),
            campaign_id: T.nilable(String),
            name: T.nilable(String),
            number: String,
            type: SurgeAPI::PhoneNumber::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Campaign < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(SurgeAPI::PhoneNumber::Campaign, SurgeAPI::Internal::AnyHash)
          end

        # The unique identifier of the campaign this phone number is attached to
        sig { returns(String) }
        attr_accessor :id

        # The current campaign attachment status for this phone number.
        sig do
          returns(
            SurgeAPI::PhoneNumber::Campaign::AttachmentStatus::TaggedSymbol
          )
        end
        attr_accessor :attachment_status

        # Campaign attachment details for a domestic local phone number
        sig do
          params(
            id: String,
            attachment_status:
              SurgeAPI::PhoneNumber::Campaign::AttachmentStatus::OrSymbol
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
                SurgeAPI::PhoneNumber::Campaign::AttachmentStatus::TaggedSymbol
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
              T.all(Symbol, SurgeAPI::PhoneNumber::Campaign::AttachmentStatus)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ATTACHED =
            T.let(
              :attached,
              SurgeAPI::PhoneNumber::Campaign::AttachmentStatus::TaggedSymbol
            )
          ATTACHMENT_PENDING =
            T.let(
              :attachment_pending,
              SurgeAPI::PhoneNumber::Campaign::AttachmentStatus::TaggedSymbol
            )
          DETACHED =
            T.let(
              :detached,
              SurgeAPI::PhoneNumber::Campaign::AttachmentStatus::TaggedSymbol
            )
          DETACHMENT_PENDING =
            T.let(
              :detachment_pending,
              SurgeAPI::PhoneNumber::Campaign::AttachmentStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::PhoneNumber::Campaign::AttachmentStatus::TaggedSymbol
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
          T.type_alias { T.all(Symbol, SurgeAPI::PhoneNumber::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOCAL = T.let(:local, SurgeAPI::PhoneNumber::Type::TaggedSymbol)
        SHORT_CODE =
          T.let(:short_code, SurgeAPI::PhoneNumber::Type::TaggedSymbol)
        TOLL_FREE = T.let(:toll_free, SurgeAPI::PhoneNumber::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[SurgeAPI::PhoneNumber::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
