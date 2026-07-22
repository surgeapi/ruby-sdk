# typed: strong

module SurgeAPI
  module Models
    class CampaignResendBrandVerificationMessageResponse < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::Models::CampaignResendBrandVerificationMessageResponse,
            SurgeAPI::Internal::AnyHash
          )
        end

      # Indicates the OTP send job was enqueued successfully.
      sig do
        returns(
          SurgeAPI::Models::CampaignResendBrandVerificationMessageResponse::Status::TaggedSymbol
        )
      end
      attr_accessor :status

      # Response when a brand verification OTP send has been enqueued
      sig do
        params(
          status:
            SurgeAPI::Models::CampaignResendBrandVerificationMessageResponse::Status::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Indicates the OTP send job was enqueued successfully.
        status:
      )
      end

      sig do
        override.returns(
          {
            status:
              SurgeAPI::Models::CampaignResendBrandVerificationMessageResponse::Status::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # Indicates the OTP send job was enqueued successfully.
      module Status
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              SurgeAPI::Models::CampaignResendBrandVerificationMessageResponse::Status
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENQUEUED =
          T.let(
            :enqueued,
            SurgeAPI::Models::CampaignResendBrandVerificationMessageResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              SurgeAPI::Models::CampaignResendBrandVerificationMessageResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
