# frozen_string_literal: true

module Surge
  module Resources
    class Blasts
      # Some parameter documentations has been truncated, see
      # {Surge::Models::BlastCreateParams} for more details.
      #
      # Sends a Blast.
      #
      # @overload create(account_id, attachments: nil, body: nil, contacts: nil, name: nil, segments: nil, send_at: nil, to: nil, request_options: {})
      #
      # @param account_id [String] The account for which the blast should be sent.
      #
      # @param attachments [Array<Surge::Models::AttachmentParams>]
      #
      # @param body [String] The message body.
      #
      # @param contacts [Array<String>] Deprecated. Use `to` instead.
      #
      # @param name [String] Optional name for the blast.
      #
      # @param segments [Array<String>] Deprecated. Use `to` instead.
      #
      # @param send_at [Time] When to send the blast. If not provided, sends immediately.
      #
      # @param to [Array<String>] List of recipients to whom the blast should be sent. This can be a combination o
      #
      # @param request_options [Surge::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Surge::Models::Blast]
      #
      # @see Surge::Models::BlastCreateParams
      def create(account_id, params = {})
        parsed, options = Surge::BlastCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["accounts/%1$s/blasts", account_id],
          body: parsed,
          model: Surge::Blast,
          options: options
        )
      end

      # @api private
      #
      # @param client [Surge::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
