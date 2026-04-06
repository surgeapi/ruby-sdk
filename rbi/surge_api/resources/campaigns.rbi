# typed: strong

module SurgeAPI
  module Resources
    class Campaigns
      # Creates a campaign to register account to send text messages.
      sig do
        params(
          account_id: String,
          campaign_params: SurgeAPI::CampaignParams,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Campaign)
      end
      def create(
        # The account for which the campaign should be created.
        account_id,
        # Parameters for creating a new campaign. Either provide full campaign details or
        # import using a TCR ID.
        campaign_params:,
        request_options: {}
      )
      end

      # Retrieves a Campaign object.
      sig do
        params(
          id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Campaign)
      end
      def retrieve(
        # The ID of the campaign to retrieve.
        id,
        request_options: {}
      )
      end

      # Updates a campaign that has not yet been approved. This can be used to fix
      # issues flagged during review and resubmit the campaign. Returns an error if the
      # campaign is currently in review, has already been approved, or has been
      # deactivated.
      sig do
        params(
          id: String,
          campaign_params: SurgeAPI::CampaignParams,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Campaign)
      end
      def update(
        # The ID of the campaign to update.
        id,
        # Parameters for creating a new campaign. Either provide full campaign details or
        # import using a TCR ID.
        campaign_params:,
        request_options: {}
      )
      end

      # List all campaigns for an account with cursor-based pagination.
      sig do
        params(
          account_id: String,
          after: String,
          before: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Internal::Cursor[SurgeAPI::Campaign])
      end
      def list(
        # The account ID to list campaigns for.
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
