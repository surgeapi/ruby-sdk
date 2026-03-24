# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Recordings#retrieve
    class RecordingRetrieveResponse < SurgeAPI::Internal::Type::BaseModel
      # @!attribute id
      #   The unique identifier for the recording
      #
      #   @return [String]
      required :id, String

      # @!attribute call
      #   The call that produced this recording
      #
      #   @return [SurgeAPI::Models::RecordingRetrieveResponse::Call]
      required :call, -> { SurgeAPI::Models::RecordingRetrieveResponse::Call }

      # @!attribute duration
      #   The duration of the recording in seconds
      #
      #   @return [Integer]
      required :duration, Integer

      # @!method initialize(id:, call:, duration:)
      #   A call recording
      #
      #   @param id [String] The unique identifier for the recording
      #
      #   @param call [SurgeAPI::Models::RecordingRetrieveResponse::Call] The call that produced this recording
      #
      #   @param duration [Integer] The duration of the recording in seconds

      # @see SurgeAPI::Models::RecordingRetrieveResponse#call
      class Call < SurgeAPI::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the call
        #
        #   @return [String]
        required :id, String

        # @!attribute contact
        #   A contact who has consented to receive messages
        #
        #   @return [SurgeAPI::Models::Contact]
        required :contact, -> { SurgeAPI::Contact }

        # @!attribute duration
        #   The duration of the call in seconds
        #
        #   @return [Integer]
        required :duration, Integer

        # @!attribute initiated_at
        #   When the call was initiated
        #
        #   @return [Time]
        required :initiated_at, Time

        # @!attribute status
        #   The status of the call
        #
        #   @return [Symbol, SurgeAPI::Models::RecordingRetrieveResponse::Call::Status]
        required :status, enum: -> { SurgeAPI::Models::RecordingRetrieveResponse::Call::Status }

        # @!method initialize(id:, contact:, duration:, initiated_at:, status:)
        #   The call that produced this recording
        #
        #   @param id [String] The unique identifier for the call
        #
        #   @param contact [SurgeAPI::Models::Contact] A contact who has consented to receive messages
        #
        #   @param duration [Integer] The duration of the call in seconds
        #
        #   @param initiated_at [Time] When the call was initiated
        #
        #   @param status [Symbol, SurgeAPI::Models::RecordingRetrieveResponse::Call::Status] The status of the call

        # The status of the call
        #
        # @see SurgeAPI::Models::RecordingRetrieveResponse::Call#status
        module Status
          extend SurgeAPI::Internal::Type::Enum

          BUSY = :busy
          CANCELED = :canceled
          COMPLETED = :completed
          FAILED = :failed
          IN_PROGRESS = :in_progress
          MISSED = :missed
          NO_ANSWER = :no_answer
          QUEUED = :queued
          RINGING = :ringing

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
