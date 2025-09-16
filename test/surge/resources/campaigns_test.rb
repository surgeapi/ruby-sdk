# frozen_string_literal: true

require_relative "../test_helper"

class Surge::Test::Resources::CampaignsTest < Surge::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @surge.campaigns.create(
        "acct_01j9a43avnfqzbjfch6pygv1td",
        consent_flow: "When customers bring in their car for service, they will fill out this web form for intake: https://fastauto.shop/bp108c In it they can choose to opt in to text message notifications. If they choose to opt in, we will send them notifications to let them know if our mechanics find issues and once the car is ready to go, as well as links to invoices and to leave us feedback.",
        description: "This phone number will send auto maintenance notifications to end users that have opted in. It will also be used for responding to customer inquiries and sending some marketing offers.",
        message_samples: [
          "You are now opted in to receive repair notifications from DT Precision Auto. Frequency varies. Msg&data rates apply. Reply STOP to opt out.",
          "You're lucky that hundred shot of NOS didn't blow the welds on the intake!",
          "Your car is ready to go. See your invoice here: https://l.fastauto.shop/s034ij"
        ],
        privacy_policy_url: "https://fastauto.shop/sms-privacy",
        use_cases: [:account_notification, :customer_care, :marketing],
        volume: :high
      )

    assert_pattern do
      response => Surge::Campaign
    end

    assert_pattern do
      response => {
        id: String,
        consent_flow: String,
        description: String,
        includes: ^(Surge::Internal::Type::ArrayOf[enum: Surge::Campaign::Include]),
        message_samples: ^(Surge::Internal::Type::ArrayOf[String]),
        privacy_policy_url: String,
        use_cases: ^(Surge::Internal::Type::ArrayOf[enum: Surge::Campaign::UseCase]),
        volume: Surge::Campaign::Volume,
        link_sample: String | nil,
        terms_and_conditions_url: String | nil
      }
    end
  end
end
