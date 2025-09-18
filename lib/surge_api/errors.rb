# frozen_string_literal: true

module SurgeAPI
  module Errors
    class Error < StandardError
      # @!attribute cause
      #
      #   @return [StandardError, nil]
    end

    class ConversionError < SurgeAPI::Errors::Error
      # @return [StandardError, nil]
      def cause = @cause.nil? ? super : @cause

      # @api private
      #
      # @param on [Class<StandardError>]
      # @param method [Symbol]
      # @param target [Object]
      # @param value [Object]
      # @param cause [StandardError, nil]
      def initialize(on:, method:, target:, value:, cause: nil)
        cls = on.name.split("::").last

        message = [
          "Failed to parse #{cls}.#{method} from #{value.class} to #{target.inspect}.",
          "To get the unparsed API response, use #{cls}[#{method.inspect}].",
          cause && "Cause: #{cause.message}"
        ].filter(&:itself).join(" ")

        @cause = cause
        super(message)
      end
    end

    class APIError < SurgeAPI::Errors::Error
      # @return [URI::Generic]
      attr_accessor :url

      # @return [Integer, nil]
      attr_accessor :status

      # @return [Hash{String=>String}, nil]
      attr_accessor :headers

      # @return [Object, nil]
      attr_accessor :body

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer, nil]
      # @param headers [Hash{String=>String}, nil]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(url:, status: nil, headers: nil, body: nil, request: nil, response: nil, message: nil)
        @url = url
        @status = status
        @headers = headers
        @body = body
        @request = request
        @response = response
        super(message)
      end
    end

    class APIConnectionError < SurgeAPI::Errors::APIError
      # @!attribute status
      #
      #   @return [nil]

      # @!attribute body
      #
      #   @return [nil]

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [nil]
      # @param headers [Hash{String=>String}, nil]
      # @param body [nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(
        url:,
        status: nil,
        headers: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Connection error."
      )
        super
      end
    end

    class APITimeoutError < SurgeAPI::Errors::APIConnectionError
      # @api private
      #
      # @param url [URI::Generic]
      # @param status [nil]
      # @param headers [Hash{String=>String}, nil]
      # @param body [nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(
        url:,
        status: nil,
        headers: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Request timed out."
      )
        super
      end
    end

    class APIStatusError < SurgeAPI::Errors::APIError
      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer]
      # @param headers [Hash{String=>String}, nil]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      #
      # @return [self]
      def self.for(url:, status:, headers:, body:, request:, response:, message: nil)
        kwargs =
          {
            url: url,
            status: status,
            headers: headers,
            body: body,
            request: request,
            response: response,
            message: message
          }

        case status
        in 400
          SurgeAPI::Errors::BadRequestError.new(**kwargs)
        in 401
          SurgeAPI::Errors::AuthenticationError.new(**kwargs)
        in 403
          SurgeAPI::Errors::PermissionDeniedError.new(**kwargs)
        in 404
          SurgeAPI::Errors::NotFoundError.new(**kwargs)
        in 409
          SurgeAPI::Errors::ConflictError.new(**kwargs)
        in 422
          SurgeAPI::Errors::UnprocessableEntityError.new(**kwargs)
        in 429
          SurgeAPI::Errors::RateLimitError.new(**kwargs)
        in (500..)
          SurgeAPI::Errors::InternalServerError.new(**kwargs)
        else
          SurgeAPI::Errors::APIStatusError.new(**kwargs)
        end
      end

      # @!parse
      #   # @return [Integer]
      #   attr_accessor :status

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer]
      # @param headers [Hash{String=>String}, nil]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(url:, status:, headers:, body:, request:, response:, message: nil)
        message ||= {url: url.to_s, status: status, body: body}
        super(
          url: url,
          status: status,
          headers: headers,
          body: body,
          request: request,
          response: response,
          message: message&.to_s
        )
      end
    end

    class BadRequestError < SurgeAPI::Errors::APIStatusError
      HTTP_STATUS = 400
    end

    class AuthenticationError < SurgeAPI::Errors::APIStatusError
      HTTP_STATUS = 401
    end

    class PermissionDeniedError < SurgeAPI::Errors::APIStatusError
      HTTP_STATUS = 403
    end

    class NotFoundError < SurgeAPI::Errors::APIStatusError
      HTTP_STATUS = 404
    end

    class ConflictError < SurgeAPI::Errors::APIStatusError
      HTTP_STATUS = 409
    end

    class UnprocessableEntityError < SurgeAPI::Errors::APIStatusError
      HTTP_STATUS = 422
    end

    class RateLimitError < SurgeAPI::Errors::APIStatusError
      HTTP_STATUS = 429
    end

    class InternalServerError < SurgeAPI::Errors::APIStatusError
      HTTP_STATUS = (500..)
    end
  end
end
