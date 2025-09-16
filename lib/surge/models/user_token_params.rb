# frozen_string_literal: true

module Surge
  module Models
    class UserTokenParams < Surge::Internal::Type::BaseModel
      # @!attribute duration_seconds
      #   For how many seconds the token should be accepted. Defaults to 15 minutes.
      #
      #   @return [Integer, nil]
      optional :duration_seconds, Integer

      # @!method initialize(duration_seconds: nil)
      #   A request to create a token
      #
      #   @param duration_seconds [Integer] For how many seconds the token should be accepted. Defaults to 15 minutes.
    end
  end
end
