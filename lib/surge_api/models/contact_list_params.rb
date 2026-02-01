# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Contacts#list
    class ContactListParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

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

      # @!method initialize(after: nil, before: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::ContactListParams} for more details.
      #
      #   @param after [String] Cursor for forward pagination. Use the next_cursor from a previous response.
      #
      #   @param before [String] Cursor for backward pagination. Use the previous_cursor from a previous response
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
