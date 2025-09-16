# frozen_string_literal: true

module Surge
  module Models
    # @see Surge::Resources::Accounts#create
    class Account < Surge::Internal::Type::BaseModel
      # @!attribute id
      #   The account ID
      #
      #   @return [String]
      required :id, String

      # @!attribute brand_name
      #   The name by which the people this account communicates with know it. If not
      #   provided, this will match the name field.
      #
      #   @return [String, nil]
      required :brand_name, String, nil?: true

      # @!attribute name
      #   The name of the account that will be visible for your internal organizational
      #   purposes. This will also be the default public-facing brand name unless you also
      #   set a `brand_name`, but otherwise the account name will never be displayed
      #   anywhere outside of Surge HQ, and may include your ID for the account or
      #   anything else that may help you.
      #
      #   @return [String]
      required :name, String

      # @!attribute organization
      #   The legal entity on whose behalf the account will be operated.
      #
      #   @return [Surge::Models::Organization]
      required :organization, -> { Surge::Organization }

      # @!attribute time_zone
      #   This is the time zone in which the account is headquartered. This time zone may
      #   be used for compliance with TCPA restrictions on when messages may be sent.
      #
      #   @return [String, nil]
      required :time_zone, String, nil?: true

      # @!method initialize(id:, brand_name:, name:, organization:, time_zone:)
      #   Some parameter documentations has been truncated, see {Surge::Models::Account}
      #   for more details.
      #
      #   Response containing account information.
      #
      #   @param id [String] The account ID
      #
      #   @param brand_name [String, nil] The name by which the people this account communicates with know it. If not prov
      #
      #   @param name [String] The name of the account that will be visible for your internal organizational pu
      #
      #   @param organization [Surge::Models::Organization] The legal entity on whose behalf the account will be operated.
      #
      #   @param time_zone [String, nil] This is the time zone in which the account is headquartered. This time zone may
    end
  end
end
