# frozen_string_literal: true

module SurgeAPI
  class Client < SurgeAPI::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # @return [String]
    attr_reader :api_key

    # @return [SurgeAPI::Resources::Accounts]
    attr_reader :accounts

    # @return [SurgeAPI::Resources::Blasts]
    attr_reader :blasts

    # @return [SurgeAPI::Resources::Campaigns]
    attr_reader :campaigns

    # @return [SurgeAPI::Resources::Contacts]
    attr_reader :contacts

    # @return [SurgeAPI::Resources::Messages]
    attr_reader :messages

    # @return [SurgeAPI::Resources::PhoneNumbers]
    attr_reader :phone_numbers

    # @return [SurgeAPI::Resources::Users]
    attr_reader :users

    # @return [SurgeAPI::Resources::Verifications]
    attr_reader :verifications

    # @return [SurgeAPI::Resources::Webhooks]
    attr_reader :webhooks

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      return {} if @api_key.nil?

      {"authorization" => "Bearer #{@api_key}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Defaults to `ENV["SURGE_API_KEY"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["SURGE_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["SURGE_API_KEY"],
      base_url: ENV["SURGE_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.surge.app"

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"SURGE_API_KEY\"")
      end

      @api_key = api_key.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @accounts = SurgeAPI::Resources::Accounts.new(client: self)
      @blasts = SurgeAPI::Resources::Blasts.new(client: self)
      @campaigns = SurgeAPI::Resources::Campaigns.new(client: self)
      @contacts = SurgeAPI::Resources::Contacts.new(client: self)
      @messages = SurgeAPI::Resources::Messages.new(client: self)
      @phone_numbers = SurgeAPI::Resources::PhoneNumbers.new(client: self)
      @users = SurgeAPI::Resources::Users.new(client: self)
      @verifications = SurgeAPI::Resources::Verifications.new(client: self)
      @webhooks = SurgeAPI::Resources::Webhooks.new(client: self)
    end
  end
end
