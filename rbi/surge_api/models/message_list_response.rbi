# typed: strong

module SurgeAPI
  module Models
    class MessageListResponse < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::Models::MessageListResponse,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The list of messages
      sig { returns(T::Array[SurgeAPI::Message]) }
      attr_accessor :data

      # Cursor-based pagination information
      sig { returns(SurgeAPI::Models::MessageListResponse::Pagination) }
      attr_reader :pagination

      sig do
        params(
          pagination: SurgeAPI::Models::MessageListResponse::Pagination::OrHash
        ).void
      end
      attr_writer :pagination

      # A paginated list of messages
      sig do
        params(
          data: T::Array[SurgeAPI::Message::OrHash],
          pagination: SurgeAPI::Models::MessageListResponse::Pagination::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The list of messages
        data:,
        # Cursor-based pagination information
        pagination:
      )
      end

      sig do
        override.returns(
          {
            data: T::Array[SurgeAPI::Message],
            pagination: SurgeAPI::Models::MessageListResponse::Pagination
          }
        )
      end
      def to_hash
      end

      class Pagination < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::Models::MessageListResponse::Pagination,
              SurgeAPI::Internal::AnyHash
            )
          end

        # Cursor for the next page of results. Null if there is no next page.
        sig { returns(T.nilable(String)) }
        attr_accessor :next_cursor

        # Cursor for the previous page of results. Null if there is no previous page.
        sig { returns(T.nilable(String)) }
        attr_accessor :previous_cursor

        # Cursor-based pagination information
        sig do
          params(
            next_cursor: T.nilable(String),
            previous_cursor: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Cursor for the next page of results. Null if there is no next page.
          next_cursor: nil,
          # Cursor for the previous page of results. Null if there is no previous page.
          previous_cursor: nil
        )
        end

        sig do
          override.returns(
            {
              next_cursor: T.nilable(String),
              previous_cursor: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
