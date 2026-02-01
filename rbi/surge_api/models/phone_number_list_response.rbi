# typed: strong

module SurgeAPI
  module Models
    class PhoneNumberListResponse < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::Models::PhoneNumberListResponse,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The list of phone numbers
      sig { returns(T::Array[SurgeAPI::PhoneNumber]) }
      attr_accessor :data

      # Cursor-based pagination information
      sig { returns(SurgeAPI::Models::PhoneNumberListResponse::Pagination) }
      attr_reader :pagination

      sig do
        params(
          pagination:
            SurgeAPI::Models::PhoneNumberListResponse::Pagination::OrHash
        ).void
      end
      attr_writer :pagination

      # A paginated list of phone numbers
      sig do
        params(
          data: T::Array[SurgeAPI::PhoneNumber::OrHash],
          pagination:
            SurgeAPI::Models::PhoneNumberListResponse::Pagination::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The list of phone numbers
        data:,
        # Cursor-based pagination information
        pagination:
      )
      end

      sig do
        override.returns(
          {
            data: T::Array[SurgeAPI::PhoneNumber],
            pagination: SurgeAPI::Models::PhoneNumberListResponse::Pagination
          }
        )
      end
      def to_hash
      end

      class Pagination < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::Models::PhoneNumberListResponse::Pagination,
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
