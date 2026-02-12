# typed: strong

module SurgeAPI
  class Client < SurgeAPI::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(String) }
    attr_reader :api_key

    sig { returns(SurgeAPI::Resources::Accounts) }
    attr_reader :accounts

    sig { returns(SurgeAPI::Resources::Blasts) }
    attr_reader :blasts

    sig { returns(SurgeAPI::Resources::Campaigns) }
    attr_reader :campaigns

    sig { returns(SurgeAPI::Resources::Contacts) }
    attr_reader :contacts

    sig { returns(SurgeAPI::Resources::Messages) }
    attr_reader :messages

    sig { returns(SurgeAPI::Resources::PhoneNumbers) }
    attr_reader :phone_numbers

    sig { returns(SurgeAPI::Resources::Recordings) }
    attr_reader :recordings

    sig { returns(SurgeAPI::Resources::Users) }
    attr_reader :users

    sig { returns(SurgeAPI::Resources::Verifications) }
    attr_reader :verifications

    sig { returns(SurgeAPI::Resources::Webhooks) }
    attr_reader :webhooks

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Defaults to `ENV["SURGE_API_KEY"]`
      api_key: ENV["SURGE_API_KEY"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["SURGE_BASE_URL"]`
      base_url: ENV["SURGE_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: SurgeAPI::Client::DEFAULT_MAX_RETRIES,
      timeout: SurgeAPI::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: SurgeAPI::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: SurgeAPI::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
