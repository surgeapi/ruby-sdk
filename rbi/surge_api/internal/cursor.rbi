# typed: strong

module SurgeAPI
  module Internal
    class Cursor
      include SurgeAPI::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :data

      sig { returns(Pagination) }
      attr_accessor :pagination

      # @api private
      sig { returns(String) }
      def inspect
      end

      class Pagination < SurgeAPI::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(Pagination, SurgeAPI::Internal::AnyHash) }

        sig { returns(T.nilable(String)) }
        attr_reader :next_cursor

        sig { params(next_cursor: String).void }
        attr_writer :next_cursor

        sig { returns(T.nilable(String)) }
        attr_reader :previous_cursor

        sig { params(previous_cursor: String).void }
        attr_writer :previous_cursor

        sig do
          params(next_cursor: String, previous_cursor: String).returns(
            T.attached_class
          )
        end
        def self.new(next_cursor: nil, previous_cursor: nil)
        end

        sig do
          override.returns({ next_cursor: String, previous_cursor: String })
        end
        def to_hash
        end
      end
    end
  end
end
