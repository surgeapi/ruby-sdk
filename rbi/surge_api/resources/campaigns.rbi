# typed: strong

module SurgeAPI
  module Resources
    class Campaigns
      # Creates a campaign to register account to send text messages.
      sig do
        params(
          account_id: String,
          params:
            T.any(
              SurgeAPI::CampaignCreateParams::Params::StandardCampaignParams::OrHash,
              SurgeAPI::CampaignCreateParams::Params::ExternalCampaignParams::OrHash
            ),
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Campaign)
      end
      def create(
        # The account for which the campaign should be created.
        account_id,
        # Parameters for creating a new campaign. Either provide full campaign details or
        # import using a TCR ID.
        params:,
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
