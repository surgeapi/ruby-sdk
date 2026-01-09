# frozen_string_literal: true

require_relative "../test_helper"

class SurgeAPI::Test::Resources::AccountsTest < SurgeAPI::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @surge.accounts.create(name: "Account #2840 - DT Precision Auto")

    assert_pattern do
      response => SurgeAPI::Account
    end

    assert_pattern do
      response => {
        id: String,
        brand_name: String | nil,
        name: String,
        organization: SurgeAPI::Organization,
        time_zone: String | nil
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @surge.accounts.update("acct_01jpqjvfg9enpt7pyxd60pcmxj")

    assert_pattern do
      response => SurgeAPI::Account
    end

    assert_pattern do
      response => {
        id: String,
        brand_name: String | nil,
        name: String,
        organization: SurgeAPI::Organization,
        time_zone: String | nil
      }
    end
  end

  def test_archive
    skip("Prism tests are disabled")

    response = @surge.accounts.archive("acct_01jpqjvfg9enpt7pyxd60pcmxj")

    assert_pattern do
      response => SurgeAPI::Account
    end

    assert_pattern do
      response => {
        id: String,
        brand_name: String | nil,
        name: String,
        organization: SurgeAPI::Organization,
        time_zone: String | nil
      }
    end
  end

  def test_retrieve_status
    skip("Prism tests are disabled")

    response = @surge.accounts.retrieve_status("acct_01jpqjvfg9enpt7pyxd60pcmxj")

    assert_pattern do
      response => SurgeAPI::AccountStatus
    end

    assert_pattern do
      response => {
        capabilities: ^(SurgeAPI::Internal::Type::HashOf[SurgeAPI::AccountStatus::Capability])
      }
    end
  end
end
