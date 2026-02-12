# typed: strong

module SurgeAPI
  module Models
    class VoicemailReceivedWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::VoicemailReceivedWebhookEvent,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The ID of the account in which this event occurred
      sig { returns(String) }
      attr_accessor :account_id

      # The data associated with the event
      sig { returns(SurgeAPI::VoicemailReceivedWebhookEvent::Data) }
      attr_reader :data

      sig do
        params(data: SurgeAPI::VoicemailReceivedWebhookEvent::Data::OrHash).void
      end
      attr_writer :data

      # The timestamp when this event occurred, in ISO8601 format
      sig { returns(Time) }
      attr_accessor :timestamp

      # The type of the event. Always `voicemail.received` for this event.
      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          account_id: String,
          data: SurgeAPI::VoicemailReceivedWebhookEvent::Data::OrHash,
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
        # The type of the event. Always `voicemail.received` for this event.
        type: :"voicemail.received"
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            data: SurgeAPI::VoicemailReceivedWebhookEvent::Data,
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
              SurgeAPI::VoicemailReceivedWebhookEvent::Data,
              SurgeAPI::Internal::AnyHash
            )
          end

        # The unique identifier for the voicemail
        sig { returns(String) }
        attr_accessor :id

        # The call that resulted in this voicemail
        sig { returns(SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call) }
        attr_reader :call

        sig do
          params(
            call: SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::OrHash
          ).void
        end
        attr_writer :call

        # The duration of the voicemail in seconds
        sig { returns(Integer) }
        attr_accessor :duration

        # The unique identifier for the recording
        sig { returns(String) }
        attr_accessor :recording_id

        # The data associated with the event
        sig do
          params(
            id: String,
            call: SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::OrHash,
            duration: Integer,
            recording_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The unique identifier for the voicemail
          id:,
          # The call that resulted in this voicemail
          call:,
          # The duration of the voicemail in seconds
          duration:,
          # The unique identifier for the recording
          recording_id:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              call: SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call,
              duration: Integer,
              recording_id: String
            }
          )
        end
        def to_hash
        end

        class Call < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call,
                SurgeAPI::Internal::AnyHash
              )
            end

          # The unique identifier for the call
          sig { returns(String) }
          attr_accessor :id

          # A contact who has consented to receive messages
          sig { returns(SurgeAPI::Contact) }
          attr_reader :contact

          sig { params(contact: SurgeAPI::Contact::OrHash).void }
          attr_writer :contact

          # The duration of the call in seconds
          sig { returns(Integer) }
          attr_accessor :duration

          # When the call was initiated
          sig { returns(Time) }
          attr_accessor :initiated_at

          # The status of the call
          sig do
            returns(
              SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          # The call that resulted in this voicemail
          sig do
            params(
              id: String,
              contact: SurgeAPI::Contact::OrHash,
              duration: Integer,
              initiated_at: Time,
              status:
                SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::Status::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The unique identifier for the call
            id:,
            # A contact who has consented to receive messages
            contact:,
            # The duration of the call in seconds
            duration:,
            # When the call was initiated
            initiated_at:,
            # The status of the call
            status:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                contact: SurgeAPI::Contact,
                duration: Integer,
                initiated_at: Time,
                status:
                  SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::Status::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # The status of the call
          module Status
            extend SurgeAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            BUSY =
              T.let(
                :busy,
                SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::Status::TaggedSymbol
              )
            CANCELED =
              T.let(
                :canceled,
                SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::Status::TaggedSymbol
              )
            COMPLETED =
              T.let(
                :completed,
                SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::Status::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::Status::TaggedSymbol
              )
            IN_PROGRESS =
              T.let(
                :in_progress,
                SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::Status::TaggedSymbol
              )
            MISSED =
              T.let(
                :missed,
                SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::Status::TaggedSymbol
              )
            NO_ANSWER =
              T.let(
                :no_answer,
                SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::Status::TaggedSymbol
              )
            QUEUED =
              T.let(
                :queued,
                SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::Status::TaggedSymbol
              )
            RINGING =
              T.let(
                :ringing,
                SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::VoicemailReceivedWebhookEvent::Data::Call::Status::TaggedSymbol
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
