# typed: strong

module SurgeAPI
  module Resources
    class TollFreeCampaigns
      # Creates a toll-free campaign and submits it for Surge review.
      sig do
        params(
          account_id: String,
          consent_flows:
            T::Array[
              T.any(
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember0::OrHash,
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::OrHash,
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember2::OrHash,
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember3::OrHash
              )
            ],
          description: String,
          message_samples: T::Array[String],
          phone_number_id: String,
          privacy_policy_url: String,
          terms_and_conditions_url: String,
          use_cases:
            T::Array[SurgeAPI::TollFreeCampaignParams::UseCase::OrSymbol],
          includes:
            T::Array[SurgeAPI::TollFreeCampaignParams::Include::OrSymbol],
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::TollFreeCampaign)
      end
      def create(
        # The account for which the toll-free campaign should be created.
        account_id,
        consent_flows:,
        # An explanation of how the toll-free number will be used.
        description:,
        message_samples:,
        # The toll-free phone number to register.
        phone_number_id:,
        privacy_policy_url:,
        terms_and_conditions_url:,
        use_cases:,
        includes: nil,
        request_options: {}
      )
      end

      # Retrieves a toll-free campaign object.
      sig do
        params(
          campaign_id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::TollFreeCampaign)
      end
      def retrieve(
        # The ID of the toll-free campaign to retrieve.
        campaign_id,
        request_options: {}
      )
      end

      # Updates a toll-free campaign awaiting customer fixes and re-submits it for Surge
      # review. Returns 409 if the campaign is not in an updatable status.
      sig do
        params(
          campaign_id: String,
          consent_flows:
            T::Array[
              T.any(
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember0::OrHash,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::OrHash,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember2::OrHash,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember3::OrHash
              )
            ],
          description: String,
          includes:
            T::Array[SurgeAPI::TollFreeCampaignUpdateParams::Include::OrSymbol],
          message_samples: T::Array[String],
          privacy_policy_url: String,
          terms_and_conditions_url: String,
          use_cases:
            T::Array[SurgeAPI::TollFreeCampaignUpdateParams::UseCase::OrSymbol],
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::TollFreeCampaign)
      end
      def update(
        # The toll-free campaign ID to update.
        campaign_id,
        consent_flows: nil,
        # An explanation of how the toll-free number will be used.
        description: nil,
        includes: nil,
        message_samples: nil,
        privacy_policy_url: nil,
        terms_and_conditions_url: nil,
        use_cases: nil,
        request_options: {}
      )
      end

      # List all toll-free campaigns for an account with cursor-based pagination.
      sig do
        params(
          account_id: String,
          after: String,
          before: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Internal::Cursor[SurgeAPI::TollFreeCampaign])
      end
      def list(
        # The account ID to list toll-free campaigns for.
        account_id,
        # Cursor for forward pagination. Use the next_cursor from a previous response.
        after: nil,
        # Cursor for backward pagination. Use the previous_cursor from a previous
        # response.
        before: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: SurgeAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
