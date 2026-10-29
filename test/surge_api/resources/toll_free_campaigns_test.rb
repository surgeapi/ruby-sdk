# frozen_string_literal: true

require_relative "../test_helper"

class SurgeAPI::Test::Resources::TollFreeCampaignsTest < SurgeAPI::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @surge.toll_free_campaigns.create(
        "acct_01j9a43avnfqzbjfch6pygv1td",
        consent_flows: [{script: "xxxxxxxxxxxxxxxxxxxx", type: :verbal}],
        description: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        message_samples: ["string"],
        phone_number_id: "phone_number_id",
        privacy_policy_url: "https://example.com",
        terms_and_conditions_url: "https://example.com",
        use_cases: [:two_factor_authentication]
      )

    assert_pattern do
      response => SurgeAPI::TollFreeCampaign
    end

    assert_pattern do
      response => {
        id: String,
        consent_flows: ^(SurgeAPI::Internal::Type::ArrayOf[union: SurgeAPI::TollFreeCampaignConsentFlow]),
        description: String | nil,
        includes: ^(SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::TollFreeCampaign::Include]),
        message_samples: ^(SurgeAPI::Internal::Type::ArrayOf[String]),
        phone_number_id: String,
        privacy_policy_url: String | nil,
        status: SurgeAPI::TollFreeCampaign::Status,
        terms_and_conditions_url: String | nil,
        use_cases: ^(SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::TollFreeCampaign::UseCase])
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @surge.toll_free_campaigns.retrieve("tfc_01j9a43avnfqzbjfch6pygv1td")

    assert_pattern do
      response => SurgeAPI::TollFreeCampaign
    end

    assert_pattern do
      response => {
        id: String,
        consent_flows: ^(SurgeAPI::Internal::Type::ArrayOf[union: SurgeAPI::TollFreeCampaignConsentFlow]),
        description: String | nil,
        includes: ^(SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::TollFreeCampaign::Include]),
        message_samples: ^(SurgeAPI::Internal::Type::ArrayOf[String]),
        phone_number_id: String,
        privacy_policy_url: String | nil,
        status: SurgeAPI::TollFreeCampaign::Status,
        terms_and_conditions_url: String | nil,
        use_cases: ^(SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::TollFreeCampaign::UseCase])
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @surge.toll_free_campaigns.update("tfc_01j9a43avnfqzbjfch6pygv1td")

    assert_pattern do
      response => SurgeAPI::TollFreeCampaign
    end

    assert_pattern do
      response => {
        id: String,
        consent_flows: ^(SurgeAPI::Internal::Type::ArrayOf[union: SurgeAPI::TollFreeCampaignConsentFlow]),
        description: String | nil,
        includes: ^(SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::TollFreeCampaign::Include]),
        message_samples: ^(SurgeAPI::Internal::Type::ArrayOf[String]),
        phone_number_id: String,
        privacy_policy_url: String | nil,
        status: SurgeAPI::TollFreeCampaign::Status,
        terms_and_conditions_url: String | nil,
        use_cases: ^(SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::TollFreeCampaign::UseCase])
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @surge.toll_free_campaigns.list("acct_01j9a43avnfqzbjfch6pygv1td")

    assert_pattern do
      response => SurgeAPI::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => SurgeAPI::TollFreeCampaign
    end

    assert_pattern do
      row => {
        id: String,
        consent_flows: ^(SurgeAPI::Internal::Type::ArrayOf[union: SurgeAPI::TollFreeCampaignConsentFlow]),
        description: String | nil,
        includes: ^(SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::TollFreeCampaign::Include]),
        message_samples: ^(SurgeAPI::Internal::Type::ArrayOf[String]),
        phone_number_id: String,
        privacy_policy_url: String | nil,
        status: SurgeAPI::TollFreeCampaign::Status,
        terms_and_conditions_url: String | nil,
        use_cases: ^(SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::TollFreeCampaign::UseCase])
      }
    end
  end
end
