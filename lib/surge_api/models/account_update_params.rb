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
      #   @return [SurgeAPI::Models::AccountUpdateParams::Organization, nil]
      optional :organization, -> { SurgeAPI::AccountUpdateParams::Organization }

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
      #   @param organization [SurgeAPI::Models::AccountUpdateParams::Organization] Parameters describing the legal entity on whose behalf the account will be opera
      #
      #   @param time_zone [String, nil] The time zone for the account
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]

      class Organization < SurgeAPI::Internal::Type::BaseModel
        # @!attribute address
        #   The address of the organization's headquarters.
        #
        #   @return [SurgeAPI::Models::AccountUpdateParams::Organization::Address, nil]
        optional :address, -> { SurgeAPI::AccountUpdateParams::Organization::Address }

        # @!attribute contact
        #   An object representing an individual who can be contacted if Surge or our
        #   carrier partners have any questions about the business. If you are registering
        #   on behalf of your customer, this must be a contact from your customer's company
        #   rather than your own. The individual will likely never be contacted unless there
        #   are issues with spam.
        #
        #   @return [SurgeAPI::Models::AccountUpdateParams::Organization::Contact, nil]
        optional :contact, -> { SurgeAPI::AccountUpdateParams::Organization::Contact }, nil?: true

        # @!attribute country
        #   The two character ISO 3166 country code for the country in which the
        #   organization is headquartered.
        #
        #   @return [String, nil]
        optional :country, String, nil?: true

        # @!attribute email
        #   For publicly traded companies, an email for a representative of the company to
        #   whom a verification email will be sent. This must be an email on the same domain
        #   as the company's website (e.g. with a website domain of
        #   `https://dtprecisionauto.com`, the email must use the same
        #   `@dtprecisionauto.com`)
        #
        #   @return [String, nil]
        optional :email, String, nil?: true

        # @!attribute identifier
        #   The value of the identifier whose type is specified in the identifier_type
        #   field. Typically this will be an EIN, and can be formatted with or without the
        #   hyphen.
        #
        #   @return [String, nil]
        optional :identifier, String, nil?: true

        # @!attribute identifier_type
        #   The type of identifier being provided for the organization. Support for more
        #   values will be added in the future.
        #
        #   @return [Symbol, SurgeAPI::Models::AccountUpdateParams::Organization::IdentifierType, nil]
        optional :identifier_type,
                 enum: -> { SurgeAPI::AccountUpdateParams::Organization::IdentifierType },
                 nil?: true

        # @!attribute industry
        #   The industry in which the organization operates.
        #
        #   @return [Symbol, SurgeAPI::Models::AccountUpdateParams::Organization::Industry, nil]
        optional :industry, enum: -> { SurgeAPI::AccountUpdateParams::Organization::Industry }, nil?: true

        # @!attribute mobile_number
        #   For sole proprietors, this must be a valid US mobile phone number to which a
        #   verification text message will be sent. (E.164 format)
        #
        #   @return [String, nil]
        optional :mobile_number, String, nil?: true

        # @!attribute regions_of_operation
        #   An array of regions in which the organization operates.
        #
        #   @return [Array<Symbol, SurgeAPI::Models::AccountUpdateParams::Organization::RegionsOfOperation>, nil]
        optional :regions_of_operation,
                 -> {
                   SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::AccountUpdateParams::Organization::RegionsOfOperation]
                 },
                 nil?: true

        # @!attribute registered_name
        #   The legal name of the organization as registered with the IRS or other relevant
        #   authorities. For some applications, this will be matched against government
        #   records and should include all punctuation and everything else as well.
        #
        #   @return [String, nil]
        optional :registered_name, String, nil?: true

        # @!attribute stock_exchange
        #   For publicly traded companies, this is the exchange on which the company's stock
        #   is traded.
        #
        #   @return [Symbol, SurgeAPI::Models::AccountUpdateParams::Organization::StockExchange, nil]
        optional :stock_exchange,
                 enum: -> { SurgeAPI::AccountUpdateParams::Organization::StockExchange },
                 nil?: true

        # @!attribute stock_symbol
        #   For publicly traded companies, the ticker symbol for the company's stock
        #
        #   @return [String, nil]
        optional :stock_symbol, String, nil?: true

        # @!attribute type
        #   The type of organization
        #
        #   @return [Symbol, SurgeAPI::Models::AccountUpdateParams::Organization::Type, nil]
        optional :type, enum: -> { SurgeAPI::AccountUpdateParams::Organization::Type }, nil?: true

        # @!attribute website
        #   The URL of the website for this organization. The website should be publicly
        #   available, clearly reflect the organization's purpose, and the URL should start
        #   with `https://`
        #
        #   @return [String, nil]
        optional :website, String, nil?: true

        # @!method initialize(address: nil, contact: nil, country: nil, email: nil, identifier: nil, identifier_type: nil, industry: nil, mobile_number: nil, regions_of_operation: nil, registered_name: nil, stock_exchange: nil, stock_symbol: nil, type: nil, website: nil)
        #   Some parameter documentations has been truncated, see
        #   {SurgeAPI::Models::AccountUpdateParams::Organization} for more details.
        #
        #   Parameters describing the legal entity on whose behalf the account will be
        #   operated.
        #
        #   @param address [SurgeAPI::Models::AccountUpdateParams::Organization::Address] The address of the organization's headquarters.
        #
        #   @param contact [SurgeAPI::Models::AccountUpdateParams::Organization::Contact, nil] An object representing an individual who can be contacted if Surge or our carrie
        #
        #   @param country [String, nil] The two character ISO 3166 country code for the country in which the organizatio
        #
        #   @param email [String, nil] For publicly traded companies, an email for a representative of the company to w
        #
        #   @param identifier [String, nil] The value of the identifier whose type is specified in the identifier_type field
        #
        #   @param identifier_type [Symbol, SurgeAPI::Models::AccountUpdateParams::Organization::IdentifierType, nil] The type of identifier being provided for the organization. Support for more val
        #
        #   @param industry [Symbol, SurgeAPI::Models::AccountUpdateParams::Organization::Industry, nil] The industry in which the organization operates.
        #
        #   @param mobile_number [String, nil] For sole proprietors, this must be a valid US mobile phone number to which a ver
        #
        #   @param regions_of_operation [Array<Symbol, SurgeAPI::Models::AccountUpdateParams::Organization::RegionsOfOperation>, nil] An array of regions in which the organization operates.
        #
        #   @param registered_name [String, nil] The legal name of the organization as registered with the IRS or other relevant
        #
        #   @param stock_exchange [Symbol, SurgeAPI::Models::AccountUpdateParams::Organization::StockExchange, nil] For publicly traded companies, this is the exchange on which the company's stock
        #
        #   @param stock_symbol [String, nil] For publicly traded companies, the ticker symbol for the company's stock
        #
        #   @param type [Symbol, SurgeAPI::Models::AccountUpdateParams::Organization::Type, nil] The type of organization
        #
        #   @param website [String, nil] The URL of the website for this organization. The website should be publicly ava

        # @see SurgeAPI::Models::AccountUpdateParams::Organization#address
        class Address < SurgeAPI::Internal::Type::BaseModel
          # @!attribute country
          #   The two character ISO 3166 country code. If none is provided, the organization's
          #   country code will be used.
          #
          #   @return [String, nil]
          optional :country, String, nil?: true

          # @!attribute line1
          #   The first line of the address, typically the number and street name
          #
          #   @return [String, nil]
          optional :line1, String, nil?: true

          # @!attribute line2
          #   The second line of the address if needed, typically an apartment or suite number
          #
          #   @return [String, nil]
          optional :line2, String, nil?: true

          # @!attribute locality
          #   The city or locality
          #
          #   @return [String, nil]
          optional :locality, String, nil?: true

          # @!attribute name
          #   The name to which any mail should be addressed. If none is provided, this will
          #   default to the organization's registered_name
          #
          #   @return [String, nil]
          optional :name, String, nil?: true

          # @!attribute postal_code
          #   The postal code
          #
          #   @return [String, nil]
          optional :postal_code, String, nil?: true

          # @!attribute region
          #   The state or region
          #
          #   @return [String, nil]
          optional :region, String, nil?: true

          # @!method initialize(country: nil, line1: nil, line2: nil, locality: nil, name: nil, postal_code: nil, region: nil)
          #   Some parameter documentations has been truncated, see
          #   {SurgeAPI::Models::AccountUpdateParams::Organization::Address} for more details.
          #
          #   The address of the organization's headquarters.
          #
          #   @param country [String, nil] The two character ISO 3166 country code. If none is provided, the organization's
          #
          #   @param line1 [String, nil] The first line of the address, typically the number and street name
          #
          #   @param line2 [String, nil] The second line of the address if needed, typically an apartment or suite number
          #
          #   @param locality [String, nil] The city or locality
          #
          #   @param name [String, nil] The name to which any mail should be addressed. If none is provided, this will d
          #
          #   @param postal_code [String, nil] The postal code
          #
          #   @param region [String, nil] The state or region
        end

        # @see SurgeAPI::Models::AccountUpdateParams::Organization#contact
        class Contact < SurgeAPI::Internal::Type::BaseModel
          # @!attribute email
          #   An email address at which the individual can be reached. Typically an email
          #   using the same domain name as the website URL will be preferred (e.g. with a
          #   website domain of `https://dtprecisionauto.com`, an email like
          #   `dom@dtprecisionauto.com` will be preferred over one like
          #   `dom@anothergarage.com` or `dom.toretto@gmail.com`. `dtprecisionauto@gmail.com`
          #   would also be acceptable, but not preferred)
          #
          #   @return [String, nil]
          optional :email, String, nil?: true

          # @!attribute first_name
          #   The first name (or given name) of the individual
          #
          #   @return [String, nil]
          optional :first_name, String, nil?: true

          # @!attribute last_name
          #   The last name (or family name) of the individual
          #
          #   @return [String, nil]
          optional :last_name, String, nil?: true

          # @!attribute phone_number
          #   A phone number at which the individual can be reached (E.164 format)
          #
          #   @return [String, nil]
          optional :phone_number, String, nil?: true

          # @!attribute title
          #   The job title of the individual.
          #
          #   @return [Symbol, SurgeAPI::Models::AccountUpdateParams::Organization::Contact::Title, nil]
          optional :title,
                   enum: -> {
                     SurgeAPI::AccountUpdateParams::Organization::Contact::Title
                   },
                   nil?: true

          # @!attribute title_other
          #   If `other` is provided for the `title` field, this field should be used to
          #   provide the title of the individual
          #
          #   @return [String, nil]
          optional :title_other, String, nil?: true

          # @!method initialize(email: nil, first_name: nil, last_name: nil, phone_number: nil, title: nil, title_other: nil)
          #   Some parameter documentations has been truncated, see
          #   {SurgeAPI::Models::AccountUpdateParams::Organization::Contact} for more details.
          #
          #   An object representing an individual who can be contacted if Surge or our
          #   carrier partners have any questions about the business. If you are registering
          #   on behalf of your customer, this must be a contact from your customer's company
          #   rather than your own. The individual will likely never be contacted unless there
          #   are issues with spam.
          #
          #   @param email [String, nil] An email address at which the individual can be reached. Typically an email usin
          #
          #   @param first_name [String, nil] The first name (or given name) of the individual
          #
          #   @param last_name [String, nil] The last name (or family name) of the individual
          #
          #   @param phone_number [String, nil] A phone number at which the individual can be reached (E.164 format)
          #
          #   @param title [Symbol, SurgeAPI::Models::AccountUpdateParams::Organization::Contact::Title, nil] The job title of the individual.
          #
          #   @param title_other [String, nil] If `other` is provided for the `title` field, this field should be used to provi

          # The job title of the individual.
          #
          # @see SurgeAPI::Models::AccountUpdateParams::Organization::Contact#title
          module Title
            extend SurgeAPI::Internal::Type::Enum

            CEO = :ceo
            CFO = :cfo
            DIRECTOR = :director
            GM = :gm
            VP = :vp
            GENERAL_COUNSEL = :general_counsel
            OTHER = :other

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # The type of identifier being provided for the organization. Support for more
        # values will be added in the future.
        #
        # @see SurgeAPI::Models::AccountUpdateParams::Organization#identifier_type
        module IdentifierType
          extend SurgeAPI::Internal::Type::Enum

          EIN = :ein

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The industry in which the organization operates.
        #
        # @see SurgeAPI::Models::AccountUpdateParams::Organization#industry
        module Industry
          extend SurgeAPI::Internal::Type::Enum

          AGRICULTURE = :agriculture
          AUTOMOTIVE = :automotive
          BANKING = :banking
          CONSTRUCTION = :construction
          CONSUMER = :consumer
          EDUCATION = :education
          ELECTRONICS = :electronics
          ENERGY = :energy
          ENGINEERING = :engineering
          FAST_MOVING_CONSUMER_GOODS = :fast_moving_consumer_goods
          FINANCIAL = :financial
          FINTECH = :fintech
          FOOD_AND_BEVERAGE = :food_and_beverage
          GOVERNMENT = :government
          HEALTHCARE = :healthcare
          HOSPITALITY = :hospitality
          INSURANCE = :insurance
          JEWELRY = :jewelry
          LEGAL = :legal
          MANUFACTURING = :manufacturing
          MEDIA = :media
          NOT_FOR_PROFIT = :not_for_profit
          OIL_AND_GAS = :oil_and_gas
          ONLINE = :online
          PROFESSIONAL_SERVICES = :professional_services
          RAW_MATERIALS = :raw_materials
          REAL_ESTATE = :real_estate
          RELIGION = :religion
          RETAIL = :retail
          TECHNOLOGY = :technology
          TELECOMMUNICATIONS = :telecommunications
          TRANSPORTATION = :transportation
          TRAVEL = :travel

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        module RegionsOfOperation
          extend SurgeAPI::Internal::Type::Enum

          AFRICA = :africa
          ASIA = :asia
          AUSTRALIA = :australia
          EUROPE = :europe
          LATIN_AMERICA = :latin_america
          USA_AND_CANADA = :usa_and_canada

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # For publicly traded companies, this is the exchange on which the company's stock
        # is traded.
        #
        # @see SurgeAPI::Models::AccountUpdateParams::Organization#stock_exchange
        module StockExchange
          extend SurgeAPI::Internal::Type::Enum

          AMEX = :amex
          AMX = :amx
          ASX = :asx
          B3 = :b3
          BME = :bme
          BSE = :bse
          FRA = :fra
          ICEX = :icex
          JPX = :jpx
          JSE = :jse
          KRX = :krx
          LON = :lon
          NASDAQ = :nasdaq
          NONE = :none
          NYSE = :nyse
          NSE = :nse
          OMX = :omx
          OTHER = :other
          SEHK = :sehk
          SGX = :sgx
          SSE = :sse
          STO = :sto
          SWX = :swx
          SZSE = :szse
          TSX = :tsx
          TWSE = :twse
          VSE = :vse

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The type of organization
        #
        # @see SurgeAPI::Models::AccountUpdateParams::Organization#type
        module Type
          extend SurgeAPI::Internal::Type::Enum

          CO_OP = :co_op
          GOVERNMENT = :government
          LLC = :llc
          NON_PROFIT = :non_profit
          PARTNERSHIP = :partnership
          PRIVATE_CORPORATION = :private_corporation
          PUBLIC_CORPORATION = :public_corporation
          SOLE_PROPRIETOR = :sole_proprietor

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
