# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Accounts#update
    class AccountUpdateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute brand_name
      #   The name by which the people this account communicates with know it. If not
      #   provided, this will match the name field.
      #
      #   @return [String, nil]
      optional :brand_name, String

      # @!attribute name
      #   The name of the account that will be visible for your internal organizational
      #   purposes. This will also be the default public-facing brand name unless you also
      #   set a `brand_name`, but otherwise the account name will never be displayed
      #   anywhere outside of Surge HQ, and may include your ID for the account or
      #   anything else that may help you.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute organization
      #   Parameters describing the legal entity on whose behalf the account will be
      #   operated.
      #
      #   @return [SurgeAPI::Models::OrganizationParams, nil]
      optional :organization, -> { SurgeAPI::OrganizationParams }

      # @!attribute time_zone
      #   The time zone for the account
      #
      #   @return [String, nil]
      optional :time_zone, String, nil?: true

      # @!method initialize(brand_name: nil, name: nil, organization: nil, time_zone: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::AccountUpdateParams} for more details.
      #
      #   @param brand_name [String] The name by which the people this account communicates with know it. If not prov
      #
      #   @param name [String] The name of the account that will be visible for your internal organizational pu
      #
      #   @param organization [SurgeAPI::Models::OrganizationParams] Parameters describing the legal entity on whose behalf the account will be opera
      #
      #   @param time_zone [String, nil] The time zone for the account
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
