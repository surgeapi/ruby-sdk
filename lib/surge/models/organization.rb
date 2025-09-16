# frozen_string_literal: true

module Surge
  module Models
    class Organization < Surge::Internal::Type::BaseModel
      # @!attribute address
      #   The address of the organization's headquarters.
      #
      #   @return [Surge::Models::Organization::Address]
      required :address, -> { Surge::Organization::Address }

      # @!attribute contact
      #   An object representing an individual who can be contacted if the carriers have
      #   any questions about the business.
      #
      #   @return [Surge::Models::Organization::Contact]
      required :contact, -> { Surge::Organization::Contact }

      # @!attribute country
      #   The two character ISO 3166 country code for the country in which the
      #   organization is headquartered.
      #
      #   @return [String, nil]
      required :country, String, nil?: true

      # @!attribute email
      #   For publicly traded companies, an email for a representative of the company to
      #   whom a verification email will be sent. This must be an email on the same domain
      #   as the company's website (e.g. with a website domain of
      #   `https://dtprecisionauto.com`, the email must use the same
      #   `@dtprecisionauto.com`)
      #
      #   @return [String, nil]
      required :email, String, nil?: true

      # @!attribute identifier
      #   The value of the identifier whose type is specified in the identifier_type
      #   field. Typically this will be an EIN, and can be formatted with or without the
      #   hyphen.
      #
      #   @return [String, nil]
      required :identifier, String, nil?: true

      # @!attribute identifier_type
      #   The type of identifier being provided for the organization. Support for more
      #   values will be added in the future.
      #
      #   @return [Symbol, Surge::Models::Organization::IdentifierType, nil]
      required :identifier_type, enum: -> { Surge::Organization::IdentifierType }, nil?: true

      # @!attribute industry
      #   The industry in which the organization operates.
      #
      #   @return [Symbol, Surge::Models::Organization::Industry, nil]
      required :industry, enum: -> { Surge::Organization::Industry }, nil?: true

      # @!attribute mobile_number
      #   For sole proprietors, this must be a valid US mobile phone number to which a
      #   verification text message will be sent. (E.164 format)
      #
      #   @return [String, nil]
      required :mobile_number, String, nil?: true

      # @!attribute regions_of_operation
      #   An array of regions in which the organization operates.
      #
      #   @return [Array<Symbol, Surge::Models::Organization::RegionsOfOperation>, nil]
      required :regions_of_operation,
               -> { Surge::Internal::Type::ArrayOf[enum: Surge::Organization::RegionsOfOperation] },
               nil?: true

      # @!attribute registered_name
      #   The legal name of the organization as registered with the IRS or other relevant
      #   authorities. For some applications, this will be matched against government
      #   records and should include all punctuation and everything else as well.
      #
      #   @return [String, nil]
      required :registered_name, String, nil?: true

      # @!attribute stock_exchange
      #   For publicly traded companies, this is the exchange on which the company's stock
      #   is traded.
      #
      #   @return [Symbol, Surge::Models::Organization::StockExchange, nil]
      required :stock_exchange, enum: -> { Surge::Organization::StockExchange }, nil?: true

      # @!attribute stock_symbol
      #   For publicly traded companies, the ticker symbol for the company's stock
      #
      #   @return [String, nil]
      required :stock_symbol, String, nil?: true

      # @!attribute type
      #   The type of organization
      #
      #   @return [Symbol, Surge::Models::Organization::Type, nil]
      required :type, enum: -> { Surge::Organization::Type }, nil?: true

      # @!attribute website
      #   The URL of the website for this organization. The website should be publicly
      #   available, clearly reflect the organization's purpose, and the URL should start
      #   with `https://`
      #
      #   @return [String, nil]
      required :website, String, nil?: true

      # @!method initialize(address:, contact:, country:, email:, identifier:, identifier_type:, industry:, mobile_number:, regions_of_operation:, registered_name:, stock_exchange:, stock_symbol:, type:, website:)
      #   Some parameter documentations has been truncated, see
      #   {Surge::Models::Organization} for more details.
      #
      #   The legal entity on whose behalf the account will be operated.
      #
      #   @param address [Surge::Models::Organization::Address] The address of the organization's headquarters.
      #
      #   @param contact [Surge::Models::Organization::Contact] An object representing an individual who can be contacted if the carriers have a
      #
      #   @param country [String, nil] The two character ISO 3166 country code for the country in which the organizatio
      #
      #   @param email [String, nil] For publicly traded companies, an email for a representative of the company to w
      #
      #   @param identifier [String, nil] The value of the identifier whose type is specified in the identifier_type field
      #
      #   @param identifier_type [Symbol, Surge::Models::Organization::IdentifierType, nil] The type of identifier being provided for the organization. Support for more val
      #
      #   @param industry [Symbol, Surge::Models::Organization::Industry, nil] The industry in which the organization operates.
      #
      #   @param mobile_number [String, nil] For sole proprietors, this must be a valid US mobile phone number to which a ver
      #
      #   @param regions_of_operation [Array<Symbol, Surge::Models::Organization::RegionsOfOperation>, nil] An array of regions in which the organization operates.
      #
      #   @param registered_name [String, nil] The legal name of the organization as registered with the IRS or other relevant
      #
      #   @param stock_exchange [Symbol, Surge::Models::Organization::StockExchange, nil] For publicly traded companies, this is the exchange on which the company's stock
      #
      #   @param stock_symbol [String, nil] For publicly traded companies, the ticker symbol for the company's stock
      #
      #   @param type [Symbol, Surge::Models::Organization::Type, nil] The type of organization
      #
      #   @param website [String, nil] The URL of the website for this organization. The website should be publicly ava

      # @see Surge::Models::Organization#address
      class Address < Surge::Internal::Type::BaseModel
        # @!attribute country
        #   The two character ISO 3166 country code. If none is provided, the organization's
        #   country code will be used.
        #
        #   @return [String, nil]
        required :country, String, nil?: true

        # @!attribute line1
        #   The first line of the address, typically the number and street name
        #
        #   @return [String, nil]
        required :line1, String, nil?: true

        # @!attribute line2
        #   The second line of the address if needed, typically an apartment or suite number
        #
        #   @return [String, nil]
        required :line2, String, nil?: true

        # @!attribute locality
        #   The city or locality
        #
        #   @return [String, nil]
        required :locality, String, nil?: true

        # @!attribute name
        #   The name to which any mail should be addressed. If none is provided, this will
        #   default to the organization's registered_name
        #
        #   @return [String, nil]
        required :name, String, nil?: true

        # @!attribute postal_code
        #   The postal code
        #
        #   @return [String, nil]
        required :postal_code, String, nil?: true

        # @!attribute region
        #   The state or region
        #
        #   @return [String, nil]
        required :region, String, nil?: true

        # @!method initialize(country:, line1:, line2:, locality:, name:, postal_code:, region:)
        #   Some parameter documentations has been truncated, see
        #   {Surge::Models::Organization::Address} for more details.
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

      # @see Surge::Models::Organization#contact
      class Contact < Surge::Internal::Type::BaseModel
        # @!attribute email
        #   An email address at which the individual can be reached. Typically an email
        #   using the same domain name as the website URL will be preferred (e.g. with a
        #   website domain of `https://dtprecisionauto.com`, an email like
        #   `dom@dtprecisionauto.com` will be preferred over one like
        #   `dom@anothergarage.com` or `dom.toretto@gmail.com`)
        #
        #   @return [String, nil]
        required :email, String, nil?: true

        # @!attribute first_name
        #   The first name (or given name) of the individual
        #
        #   @return [String, nil]
        required :first_name, String, nil?: true

        # @!attribute last_name
        #   The last name (or family name) of the individual
        #
        #   @return [String, nil]
        required :last_name, String, nil?: true

        # @!attribute phone_number
        #   A phone number at which the individual can be reached (E.164 format)
        #
        #   @return [String, nil]
        required :phone_number, String, nil?: true

        # @!attribute title
        #   The job title of the individual.
        #
        #   @return [Symbol, Surge::Models::Organization::Contact::Title, nil]
        required :title, enum: -> { Surge::Organization::Contact::Title }, nil?: true

        # @!attribute title_other
        #   If `other` is provided for the `title` field, this field should be used to
        #   provide the title of the individual
        #
        #   @return [String, nil]
        required :title_other, String, nil?: true

        # @!method initialize(email:, first_name:, last_name:, phone_number:, title:, title_other:)
        #   Some parameter documentations has been truncated, see
        #   {Surge::Models::Organization::Contact} for more details.
        #
        #   An object representing an individual who can be contacted if the carriers have
        #   any questions about the business.
        #
        #   @param email [String, nil] An email address at which the individual can be reached. Typically an email usin
        #
        #   @param first_name [String, nil] The first name (or given name) of the individual
        #
        #   @param last_name [String, nil] The last name (or family name) of the individual
        #
        #   @param phone_number [String, nil] A phone number at which the individual can be reached (E.164 format)
        #
        #   @param title [Symbol, Surge::Models::Organization::Contact::Title, nil] The job title of the individual.
        #
        #   @param title_other [String, nil] If `other` is provided for the `title` field, this field should be used to provi

        # The job title of the individual.
        #
        # @see Surge::Models::Organization::Contact#title
        module Title
          extend Surge::Internal::Type::Enum

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
      # @see Surge::Models::Organization#identifier_type
      module IdentifierType
        extend Surge::Internal::Type::Enum

        EIN = :ein

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The industry in which the organization operates.
      #
      # @see Surge::Models::Organization#industry
      module Industry
        extend Surge::Internal::Type::Enum

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
        extend Surge::Internal::Type::Enum

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
      # @see Surge::Models::Organization#stock_exchange
      module StockExchange
        extend Surge::Internal::Type::Enum

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
      # @see Surge::Models::Organization#type
      module Type
        extend Surge::Internal::Type::Enum

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
