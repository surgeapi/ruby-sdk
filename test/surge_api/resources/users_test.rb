# frozen_string_literal: true

require_relative "../test_helper"

class SurgeAPI::Test::Resources::UsersTest < SurgeAPI::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @surge.users.create("acct_01j9a43avnfqzbjfch6pygv1td", first_name: "Brian")

    assert_pattern do
      response => SurgeAPI::User
    end

    assert_pattern do
      response => {
        first_name: String,
        id: String | nil,
        last_name: String | nil,
        metadata: ^(SurgeAPI::Internal::Type::HashOf[String]) | nil,
        photo_url: String | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @surge.users.retrieve("usr_01j9dwavghe1ttppewekjjkfrx")

    assert_pattern do
      response => SurgeAPI::User
    end

    assert_pattern do
      response => {
        first_name: String,
        id: String | nil,
        last_name: String | nil,
        metadata: ^(SurgeAPI::Internal::Type::HashOf[String]) | nil,
        photo_url: String | nil
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @surge.users.update("usr_01j9dwavghe1ttppewekjjkfrx", first_name: "Brian")

    assert_pattern do
      response => SurgeAPI::User
    end

    assert_pattern do
      response => {
        first_name: String,
        id: String | nil,
        last_name: String | nil,
        metadata: ^(SurgeAPI::Internal::Type::HashOf[String]) | nil,
        photo_url: String | nil
      }
    end
  end

  def test_create_token
    skip("Prism tests are disabled")

    response = @surge.users.create_token("usr_01jymgdfrpec2asc5m0z3a6fr9")

    assert_pattern do
      response => SurgeAPI::UserTokenResponse
    end

    assert_pattern do
      response => {
        token: String | nil
      }
    end
  end
end
