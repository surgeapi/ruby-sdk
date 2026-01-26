# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Blasts#create
    class BlastCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute attachments
      #
      #   @return [Array<SurgeAPI::Models::BlastCreateParams::Attachment>, nil]
      optional :attachments, -> { SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::BlastCreateParams::Attachment] }

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

      # @!attribute from
      #   The phone number from which to send the blast. This can be either the phone
      #   number in E.164 format or a Surge phone number id. If not provided, the
      #   account's default phone number is used.
      #
      #   @return [String, nil]
      optional :from, String

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

      # @!method initialize(attachments: nil, body: nil, contacts: nil, from: nil, name: nil, segments: nil, send_at: nil, to: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::BlastCreateParams} for more details.
      #
      #   @param attachments [Array<SurgeAPI::Models::BlastCreateParams::Attachment>]
      #
      #   @param body [String] The message body.
      #
      #   @param contacts [Array<String>] Deprecated. Use `to` instead.
      #
      #   @param from [String] The phone number from which to send the blast. This can be either the phone numb
      #
      #   @param name [String] Optional name for the blast.
      #
      #   @param segments [Array<String>] Deprecated. Use `to` instead.
      #
      #   @param send_at [Time] When to send the blast. If not provided, sends immediately.
      #
      #   @param to [Array<String>] List of recipients to whom the blast should be sent. This can be a combination o
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]

      class Attachment < SurgeAPI::Internal::Type::BaseModel
        # @!attribute url
        #   The URL of the attachment.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(url:)
        #   Params for creating an attachment
        #
        #   @param url [String] The URL of the attachment.
      end
    end
  end
end
