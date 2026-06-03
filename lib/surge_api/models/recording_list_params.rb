# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Recordings#list
    class RecordingListParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The account ID to list recordings for.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute after
      #   Cursor for forward pagination. Use the next_cursor from a previous response.
      #
      #   @return [String, nil]
      optional :after, String

      # @!attribute before
      #   Cursor for backward pagination. Use the previous_cursor from a previous
      #   response.
      #
      #   @return [String, nil]
      optional :before, String

      # @!method initialize(account_id:, after: nil, before: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::RecordingListParams} for more details.
      #
      #   @param account_id [String] The account ID to list recordings for.
      #
      #   @param after [String] Cursor for forward pagination. Use the next_cursor from a previous response.
      #
      #   @param before [String] Cursor for backward pagination. Use the previous_cursor from a previous response
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
