# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Blasts#create
    class Blast < SurgeAPI::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the object.
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute attachments
      #
      #   @return [Array<SurgeAPI::Models::Blast::Attachment>, nil]
      optional :attachments, -> { SurgeAPI::Internal::Type::ArrayOf[SurgeAPI::Blast::Attachment] }

      # @!attribute body
      #   The message body.
      #
      #   @return [String, nil]
      optional :body, String, nil?: true

      # @!attribute name
      #   Optional name for the blast.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute send_at
      #   When the blast will be or was sent.
      #
      #   @return [Time, nil]
      optional :send_at, Time

      # @!method initialize(id: nil, attachments: nil, body: nil, name: nil, send_at: nil)
      #   A Blast is a message sent to multiple recipients at once.
      #
      #   @param id [String] Unique identifier for the object.
      #
      #   @param attachments [Array<SurgeAPI::Models::Blast::Attachment>]
      #
      #   @param body [String, nil] The message body.
      #
      #   @param name [String] Optional name for the blast.
      #
      #   @param send_at [Time] When the blast will be or was sent.

      class Attachment < SurgeAPI::Internal::Type::BaseModel
        # @!attribute url
        #   The URL of the attachment.
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(url: nil)
        #   @param url [String] The URL of the attachment.
      end
    end
  end
end
