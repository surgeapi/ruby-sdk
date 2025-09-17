# typed: strong

module SurgeAPI
  module Models
    class CallEndedWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SurgeAPI::CallEndedWebhookEvent, SurgeAPI::Internal::AnyHash)
        end

      # The ID of the account in which this event occurred
      sig { returns(String) }
      attr_accessor :account_id

      # The data associated with the event
      sig { returns(SurgeAPI::CallEndedWebhookEvent::Data) }
      attr_reader :data

      sig { params(data: SurgeAPI::CallEndedWebhookEvent::Data::OrHash).void }
      attr_writer :data

      # The timestamp when this event occurred, in ISO8601 format
      sig { returns(Time) }
      attr_accessor :timestamp

      # The type of the event. Always `call.ended` for this event.
      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          account_id: String,
          data: SurgeAPI::CallEndedWebhookEvent::Data::OrHash,
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
        # The type of the event. Always `call.ended` for this event.
        type: :"call.ended"
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            data: SurgeAPI::CallEndedWebhookEvent::Data,
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
              SurgeAPI::CallEndedWebhookEvent::Data,
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
          returns(SurgeAPI::CallEndedWebhookEvent::Data::Status::TaggedSymbol)
        end
        attr_accessor :status

        # The data associated with the event
        sig do
          params(
            id: String,
            contact: SurgeAPI::Contact::OrHash,
            duration: Integer,
            initiated_at: Time,
            status: SurgeAPI::CallEndedWebhookEvent::Data::Status::OrSymbol
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
                SurgeAPI::CallEndedWebhookEvent::Data::Status::TaggedSymbol
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
              T.all(Symbol, SurgeAPI::CallEndedWebhookEvent::Data::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BUSY =
            T.let(
              :busy,
              SurgeAPI::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          CANCELED =
            T.let(
              :canceled,
              SurgeAPI::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :completed,
              SurgeAPI::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              SurgeAPI::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          IN_PROGRESS =
            T.let(
              :in_progress,
              SurgeAPI::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          MISSED =
            T.let(
              :missed,
              SurgeAPI::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          NO_ANSWER =
            T.let(
              :no_answer,
              SurgeAPI::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          QUEUED =
            T.let(
              :queued,
              SurgeAPI::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          RINGING =
            T.let(
              :ringing,
              SurgeAPI::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::CallEndedWebhookEvent::Data::Status::TaggedSymbol
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
