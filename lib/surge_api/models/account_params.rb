# frozen_string_literal: true

module SurgeAPI
  module Models
    class AccountParams < SurgeAPI::Internal::Type::BaseModel
      # @!attribute name
      #   The name of the account that will be visible for your internal organizational
      #   purposes. This will also be the default public-facing brand name unless you also
      #   set a `brand_name`, but otherwise the account name will never be displayed
      #   anywhere outside of Surge HQ, and may include your ID for the account or
      #   anything else that may help you.
      #
      #   @return [String]
      required :name, String

      # @!attribute brand_name
      #   The name by which the people this account communicates with know it. If not
      #   provided, this will match the name field.
      #
      #   @return [String, nil]
      optional :brand_name, String, nil?: true

      # @!attribute organization
      #   Parameters describing the legal entity on whose behalf the account will be
      #   operated.
      #
      #   @return [SurgeAPI::Models::OrganizationParams, nil]
      optional :organization, -> { SurgeAPI::OrganizationParams }

      # @!attribute time_zone
      #   This is the time zone in which the account is headquartered. This time zone may
      #   be used for compliance with TCPA restrictions on when messages may be sent.
      #
      #   @return [String, nil]
      optional :time_zone, String

      # @!method initialize(name:, brand_name: nil, organization: nil, time_zone: nil)
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::AccountParams} for more details.
      #
      #   Parameters for creating a new account.
      #
      #   @param name [String] The name of the account that will be visible for your internal organizational pu
      #
      #   @param brand_name [String, nil] The name by which the people this account communicates with know it. If not prov
      #
      #   @param organization [SurgeAPI::Models::OrganizationParams] Parameters describing the legal entity on whose behalf the account will be opera
      #
      #   @param time_zone [String] This is the time zone in which the account is headquartered. This time zone may
    end
  end
end
