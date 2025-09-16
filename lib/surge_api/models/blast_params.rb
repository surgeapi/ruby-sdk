# frozen_string_literal: true

module SurgeAPI
  module Models
    class BlastParams < SurgeAPI::Internal::Type::BaseModel
      # @!attribute attachments
      #
      #   @return [Array<SurgeAPI::Models::AttachmentParams>, nil]
      optional :attachments, -> { SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::AttachmentParams] }

      # @!attribute body
      #   The message body.
      #
      #   @return [String, nil]
      optional :body, String

      # @!attribute contacts
      #   @deprecated
      #
      #   Deprecated. Use `to` instead.
      #
      #   @return [Array<String>, nil]
      optional :contacts, SurgeAPI::Internal::Type::ArrayOf[String]

      # @!attribute name
      #   Optional name for the blast.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute segments
      #   @deprecated
      #
      #   Deprecated. Use `to` instead.
      #
      #   @return [Array<String>, nil]
      optional :segments, SurgeAPI::Internal::Type::ArrayOf[String]

      # @!attribute send_at
      #   When to send the blast. If not provided, sends immediately.
      #
      #   @return [Time, nil]
      optional :send_at, Time

      # @!attribute to
      #   List of recipients to whom the blast should be sent. This can be a combination
      #   of contact IDs, segment IDs, and phone numbers.
      #
      #   @return [Array<String>, nil]
      optional :to, SurgeAPI::Internal::Type::ArrayOf[String]

      # @!method initialize(attachments: nil, body: nil, contacts: nil, name: nil, segments: nil, send_at: nil, to: nil)
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::BlastParams} for more details.
      #
      #   Parameters for creating a Blast
      #
      #   @param attachments [Array<SurgeAPI::Models::AttachmentParams>]
      #
      #   @param body [String] The message body.
      #
      #   @param contacts [Array<String>] Deprecated. Use `to` instead.
      #
      #   @param name [String] Optional name for the blast.
      #
      #   @param segments [Array<String>] Deprecated. Use `to` instead.
      #
      #   @param send_at [Time] When to send the blast. If not provided, sends immediately.
      #
      #   @param to [Array<String>] List of recipients to whom the blast should be sent. This can be a combination o
    end
  end
end
