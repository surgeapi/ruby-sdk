# typed: strong

module SurgeAPI
  module Models
    class CampaignWarningWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::CampaignWarningWebhookEvent,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The ID of the account in which this event occurred
      sig { returns(String) }
      attr_accessor :account_id

      # The data associated with the event
      sig { returns(SurgeAPI::CampaignWarningWebhookEvent::Data) }
      attr_reader :data

      sig do
        params(data: SurgeAPI::CampaignWarningWebhookEvent::Data::OrHash).void
      end
      attr_writer :data

      # The timestamp when this event occurred, in ISO8601 format
      sig { returns(Time) }
      attr_accessor :timestamp

      # The type of the event. Always `campaign.warning` for this event.
      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          account_id: String,
          data: SurgeAPI::CampaignWarningWebhookEvent::Data::OrHash,
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
        # The type of the event. Always `campaign.warning` for this event.
        type: :"campaign.warning"
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            data: SurgeAPI::CampaignWarningWebhookEvent::Data,
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
              SurgeAPI::CampaignWarningWebhookEvent::Data,
              SurgeAPI::Internal::AnyHash
            )
          end

        # The unique identifier for the campaign
        sig { returns(String) }
        attr_accessor :id

        # Customer-visible field-level registration feedback. Rejection events may include
        # non-blocking warnings alongside changes-needed items.
        sig do
          returns(
            T::Array[SurgeAPI::CampaignWarningWebhookEvent::Data::Feedback]
          )
        end
        attr_accessor :feedback

        # The public campaign status. Always `in_review` for this event.
        sig do
          returns(
            SurgeAPI::CampaignWarningWebhookEvent::Data::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # The data associated with the event
        sig do
          params(
            id: String,
            feedback:
              T::Array[
                SurgeAPI::CampaignWarningWebhookEvent::Data::Feedback::OrHash
              ],
            status:
              SurgeAPI::CampaignWarningWebhookEvent::Data::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The unique identifier for the campaign
          id:,
          # Customer-visible field-level registration feedback. Rejection events may include
          # non-blocking warnings alongside changes-needed items.
          feedback:,
          # The public campaign status. Always `in_review` for this event.
          status:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              feedback:
                T::Array[SurgeAPI::CampaignWarningWebhookEvent::Data::Feedback],
              status:
                SurgeAPI::CampaignWarningWebhookEvent::Data::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        class Feedback < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::CampaignWarningWebhookEvent::Data::Feedback,
                SurgeAPI::Internal::AnyHash
              )
            end

          # The stable registration field key
          sig { returns(String) }
          attr_accessor :field

          # Actionable review feedback
          sig { returns(String) }
          attr_accessor :message

          # Whether the feedback blocks registration or is a non-blocking warning
          sig do
            returns(
              SurgeAPI::CampaignWarningWebhookEvent::Data::Feedback::Outcome::TaggedSymbol
            )
          end
          attr_accessor :outcome

          # A suggested replacement value, or null when none is suggested
          sig { returns(T.nilable(String)) }
          attr_accessor :suggested_value

          sig do
            params(
              field: String,
              message: String,
              outcome:
                SurgeAPI::CampaignWarningWebhookEvent::Data::Feedback::Outcome::OrSymbol,
              suggested_value: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The stable registration field key
            field:,
            # Actionable review feedback
            message:,
            # Whether the feedback blocks registration or is a non-blocking warning
            outcome:,
            # A suggested replacement value, or null when none is suggested
            suggested_value:
          )
          end

          sig do
            override.returns(
              {
                field: String,
                message: String,
                outcome:
                  SurgeAPI::CampaignWarningWebhookEvent::Data::Feedback::Outcome::TaggedSymbol,
                suggested_value: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # Whether the feedback blocks registration or is a non-blocking warning
          module Outcome
            extend SurgeAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  SurgeAPI::CampaignWarningWebhookEvent::Data::Feedback::Outcome
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            WARNING =
              T.let(
                :warning,
                SurgeAPI::CampaignWarningWebhookEvent::Data::Feedback::Outcome::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::CampaignWarningWebhookEvent::Data::Feedback::Outcome::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        # The public campaign status. Always `in_review` for this event.
        module Status
          extend SurgeAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, SurgeAPI::CampaignWarningWebhookEvent::Data::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IN_REVIEW =
            T.let(
              :in_review,
              SurgeAPI::CampaignWarningWebhookEvent::Data::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::CampaignWarningWebhookEvent::Data::Status::TaggedSymbol
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
