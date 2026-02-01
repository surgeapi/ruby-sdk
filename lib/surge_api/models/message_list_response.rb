# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Messages#list
    class MessageListResponse < SurgeAPI::Internal::Type::BaseModel
      # @!attribute data
      #   The list of messages
      #
      #   @return [Array<SurgeAPI::Models::Message>]
      required :data, -> { SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::Message] }

      # @!attribute pagination
      #   Cursor-based pagination information
      #
      #   @return [SurgeAPI::Models::MessageListResponse::Pagination]
      required :pagination, -> { SurgeAPI::Models::MessageListResponse::Pagination }

      # @!method initialize(data:, pagination:)
      #   A paginated list of messages
      #
      #   @param data [Array<SurgeAPI::Models::Message>] The list of messages
      #
      #   @param pagination [SurgeAPI::Models::MessageListResponse::Pagination] Cursor-based pagination information

      # @see SurgeAPI::Models::MessageListResponse#pagination
      class Pagination < SurgeAPI::Internal::Type::BaseModel
        # @!attribute next_cursor
        #   Cursor for the next page of results. Null if there is no next page.
        #
        #   @return [String, nil]
        optional :next_cursor, String, nil?: true

        # @!attribute previous_cursor
        #   Cursor for the previous page of results. Null if there is no previous page.
        #
        #   @return [String, nil]
        optional :previous_cursor, String, nil?: true

        # @!method initialize(next_cursor: nil, previous_cursor: nil)
        #   Cursor-based pagination information
        #
        #   @param next_cursor [String, nil] Cursor for the next page of results. Null if there is no next page.
        #
        #   @param previous_cursor [String, nil] Cursor for the previous page of results. Null if there is no previous page.
      end
    end
  end
end
