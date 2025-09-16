# frozen_string_literal: true

require_relative "../test_helper"

class Surge::Test::Resources::AccountsTest < Surge::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @surge.accounts.create(name: "Account #2840 - DT Precision Auto")

    assert_pattern do
      response => Surge::Account
    end

    assert_pattern do
      response => {
        id: String,
        brand_name: String | nil,
        name: String,
        organization: Surge::Organization,
        time_zone: String | nil
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @surge.accounts.update("acct_01jpqjvfg9enpt7pyxd60pcmxj")

    assert_pattern do
      response => Surge::Account
    end

    assert_pattern do
      response => {
        id: String,
        brand_name: String | nil,
        name: String,
        organization: Surge::Organization,
        time_zone: String | nil
      }
    end
  end

  def test_retrieve_status
    skip("Prism tests are disabled")

    response = @surge.accounts.retrieve_status("acct_01jpqjvfg9enpt7pyxd60pcmxj")

    assert_pattern do
      response => Surge::AccountStatus
    end

    assert_pattern do
      response => {
        capabilities: ^(Surge::Internal::Type::HashOf[Surge::AccountStatus::Capability])
      }
    end
  end
end
