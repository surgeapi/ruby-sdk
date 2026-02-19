# typed: strong

module SurgeAPI
  module Models
    class RecordingDeleteResponse < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::Models::RecordingDeleteResponse,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The unique identifier for the recording
      sig { returns(String) }
      attr_accessor :id

      # The call that produced this recording
      sig { returns(SurgeAPI::Models::RecordingDeleteResponse::Call) }
      attr_reader :call

      sig do
        params(
          call: SurgeAPI::Models::RecordingDeleteResponse::Call::OrHash
        ).void
      end
      attr_writer :call

      # The duration of the recording in seconds
      sig { returns(Integer) }
      attr_accessor :duration

      # A call recording
      sig do
        params(
          id: String,
          call: SurgeAPI::Models::RecordingDeleteResponse::Call::OrHash,
          duration: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # The unique identifier for the recording
        id:,
        # The call that produced this recording
        call:,
        # The duration of the recording in seconds
        duration:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            call: SurgeAPI::Models::RecordingDeleteResponse::Call,
            duration: Integer
          }
        )
      end
      def to_hash
      end

      class Call < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::Models::RecordingDeleteResponse::Call,
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
            SurgeAPI::Models::RecordingDeleteResponse::Call::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # The call that produced this recording
        sig do
          params(
            id: String,
            contact: SurgeAPI::Contact::OrHash,
            duration: Integer,
            initiated_at: Time,
            status:
              SurgeAPI::Models::RecordingDeleteResponse::Call::Status::OrSymbol
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
                SurgeAPI::Models::RecordingDeleteResponse::Call::Status::TaggedSymbol
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
                SurgeAPI::Models::RecordingDeleteResponse::Call::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BUSY =
            T.let(
              :busy,
              SurgeAPI::Models::RecordingDeleteResponse::Call::Status::TaggedSymbol
            )
          CANCELED =
            T.let(
              :canceled,
              SurgeAPI::Models::RecordingDeleteResponse::Call::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :completed,
              SurgeAPI::Models::RecordingDeleteResponse::Call::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              SurgeAPI::Models::RecordingDeleteResponse::Call::Status::TaggedSymbol
            )
          IN_PROGRESS =
            T.let(
              :in_progress,
              SurgeAPI::Models::RecordingDeleteResponse::Call::Status::TaggedSymbol
            )
          MISSED =
            T.let(
              :missed,
              SurgeAPI::Models::RecordingDeleteResponse::Call::Status::TaggedSymbol
            )
          NO_ANSWER =
            T.let(
              :no_answer,
              SurgeAPI::Models::RecordingDeleteResponse::Call::Status::TaggedSymbol
            )
          QUEUED =
            T.let(
              :queued,
              SurgeAPI::Models::RecordingDeleteResponse::Call::Status::TaggedSymbol
            )
          RINGING =
            T.let(
              :ringing,
              SurgeAPI::Models::RecordingDeleteResponse::Call::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::Models::RecordingDeleteResponse::Call::Status::TaggedSymbol
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
