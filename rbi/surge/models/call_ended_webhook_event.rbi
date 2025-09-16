# typed: strong

module Surge
  module Models
    class CallEndedWebhookEvent < Surge::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Surge::CallEndedWebhookEvent, Surge::Internal::AnyHash)
        end

      # The ID of the account in which this event occurred
      sig { returns(String) }
      attr_accessor :account_id

      # The data associated with the event
      sig { returns(Surge::CallEndedWebhookEvent::Data) }
      attr_reader :data

      sig { params(data: Surge::CallEndedWebhookEvent::Data::OrHash).void }
      attr_writer :data

      # The timestamp when this event occurred, in ISO8601 format
      sig { returns(Time) }
      attr_accessor :timestamp

      # The type of the event. Always `call.ended` for this event.
      sig { returns(Surge::CallEndedWebhookEvent::Type::TaggedSymbol) }
      attr_accessor :type

      # The `call.ended` event is delivered whenever a call is completed between a Surge
      # number you own and another phone number.
      sig do
        params(
          account_id: String,
          data: Surge::CallEndedWebhookEvent::Data::OrHash,
          timestamp: Time,
          type: Surge::CallEndedWebhookEvent::Type::OrSymbol
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
        type:
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            data: Surge::CallEndedWebhookEvent::Data,
            timestamp: Time,
            type: Surge::CallEndedWebhookEvent::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Data < Surge::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Surge::CallEndedWebhookEvent::Data, Surge::Internal::AnyHash)
          end

        # The unique identifier for the call
        sig { returns(String) }
        attr_accessor :id

        # A contact who has consented to receive messages
        sig { returns(Surge::Contact) }
        attr_reader :contact

        sig { params(contact: Surge::Contact::OrHash).void }
        attr_writer :contact

        # The duration of the call in seconds
        sig { returns(Integer) }
        attr_accessor :duration

        # When the call was initiated
        sig { returns(Time) }
        attr_accessor :initiated_at

        # The status of the call
        sig do
          returns(Surge::CallEndedWebhookEvent::Data::Status::TaggedSymbol)
        end
        attr_accessor :status

        # The data associated with the event
        sig do
          params(
            id: String,
            contact: Surge::Contact::OrHash,
            duration: Integer,
            initiated_at: Time,
            status: Surge::CallEndedWebhookEvent::Data::Status::OrSymbol
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
              contact: Surge::Contact,
              duration: Integer,
              initiated_at: Time,
              status: Surge::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The status of the call
        module Status
          extend Surge::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Surge::CallEndedWebhookEvent::Data::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BUSY =
            T.let(
              :busy,
              Surge::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          CANCELED =
            T.let(
              :canceled,
              Surge::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :completed,
              Surge::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Surge::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          IN_PROGRESS =
            T.let(
              :in_progress,
              Surge::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          MISSED =
            T.let(
              :missed,
              Surge::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          NO_ANSWER =
            T.let(
              :no_answer,
              Surge::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          QUEUED =
            T.let(
              :queued,
              Surge::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )
          RINGING =
            T.let(
              :ringing,
              Surge::CallEndedWebhookEvent::Data::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Surge::CallEndedWebhookEvent::Data::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      # The type of the event. Always `call.ended` for this event.
      module Type
        extend Surge::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Surge::CallEndedWebhookEvent::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CALL_ENDED =
          T.let(:"call.ended", Surge::CallEndedWebhookEvent::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Surge::CallEndedWebhookEvent::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
