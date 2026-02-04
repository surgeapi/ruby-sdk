# frozen_string_literal: true

module SurgeAPI
  module Internal
    # @generic Elem
    #
    # @example
    #   if cursor.has_next?
    #     cursor = cursor.next_page
    #   end
    #
    # @example
    #   cursor.auto_paging_each do |contact|
    #     puts(contact)
    #   end
    class Cursor
      include SurgeAPI::Internal::Type::BasePage

      # @return [Array<generic<Elem>>, nil]
      attr_accessor :data

      # @return [Pagination]
      attr_accessor :pagination

      # @return [Boolean]
      def next_page?
        !data.to_a.empty? && (!pagination&.previous_cursor.to_s.empty? || !pagination&.next_cursor.to_s.empty?)
      end

      # @raise [SurgeAPI::HTTP::Error]
      # @return [self]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = SurgeAPI::Internal::Util.deep_merge(
          @req,
          {
            query: pagination&.previous_cursor.nil? ? {after: pagination&.next_cursor} : {before: pagination&.previous_cursor}
          }
        )
        @client.request(req)
      end

      # @param blk [Proc]
      #
      # @yieldparam [generic<Elem>]
      def auto_paging_each(&blk)
        unless block_given?
          raise ArgumentError.new("A block must be given to ##{__method__}")
        end

        page = self
        loop do
          page.data&.each(&blk)

          break unless page.next_page?
          page = page.next_page
        end
      end

      # @api private
      #
      # @param client [SurgeAPI::Internal::Transport::BaseClient]
      # @param req [Hash{Symbol=>Object}]
      # @param headers [Hash{String=>String}]
      # @param page_data [Hash{Symbol=>Object}]
      def initialize(client:, req:, headers:, page_data:)
        super

        case page_data
        in {data: Array => data}
          @data = data.map { SurgeAPI::Internal::Type::Converter.coerce(@model, _1) }
        else
        end
        case page_data
        in {pagination: Hash | nil => pagination}
          @pagination =
            SurgeAPI::Internal::Type::Converter.coerce(SurgeAPI::Internal::Cursor::Pagination, pagination)
        else
        end
      end

      # @api private
      #
      # @return [String]
      def inspect
        model = SurgeAPI::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)}>"
      end

      class Pagination < SurgeAPI::Internal::Type::BaseModel
        # @!attribute next_cursor
        #
        #   @return [String, nil]
        optional :next_cursor, String

        # @!attribute previous_cursor
        #
        #   @return [String, nil]
        optional :previous_cursor, String

        # @!method initialize(next_cursor: nil, previous_cursor: nil)
        #   @param next_cursor [String]
        #   @param previous_cursor [String]
      end
    end
  end
end
