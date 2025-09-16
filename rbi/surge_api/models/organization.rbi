# typed: strong

module SurgeAPI
  module Models
    class Organization < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SurgeAPI::Organization, SurgeAPI::Internal::AnyHash)
        end

      # The address of the organization's headquarters.
      sig { returns(SurgeAPI::Organization::Address) }
      attr_reader :address

      sig { params(address: SurgeAPI::Organization::Address::OrHash).void }
      attr_writer :address

      # An object representing an individual who can be contacted if the carriers have
      # any questions about the business.
      sig { returns(SurgeAPI::Organization::Contact) }
      attr_reader :contact

      sig { params(contact: SurgeAPI::Organization::Contact::OrHash).void }
      attr_writer :contact

      # The two character ISO 3166 country code for the country in which the
      # organization is headquartered.
      sig { returns(T.nilable(String)) }
      attr_accessor :country

      # For publicly traded companies, an email for a representative of the company to
      # whom a verification email will be sent. This must be an email on the same domain
      # as the company's website (e.g. with a website domain of
      # `https://dtprecisionauto.com`, the email must use the same
      # `@dtprecisionauto.com`)
      sig { returns(T.nilable(String)) }
      attr_accessor :email

      # The value of the identifier whose type is specified in the identifier_type
      # field. Typically this will be an EIN, and can be formatted with or without the
      # hyphen.
      sig { returns(T.nilable(String)) }
      attr_accessor :identifier

      # The type of identifier being provided for the organization. Support for more
      # values will be added in the future.
      sig do
        returns(T.nilable(SurgeAPI::Organization::IdentifierType::TaggedSymbol))
      end
      attr_accessor :identifier_type

      # The industry in which the organization operates.
      sig { returns(T.nilable(SurgeAPI::Organization::Industry::TaggedSymbol)) }
      attr_accessor :industry

      # For sole proprietors, this must be a valid US mobile phone number to which a
      # verification text message will be sent. (E.164 format)
      sig { returns(T.nilable(String)) }
      attr_accessor :mobile_number

      # An array of regions in which the organization operates.
      sig do
        returns(
          T.nilable(
            T::Array[SurgeAPI::Organization::RegionsOfOperation::TaggedSymbol]
          )
        )
      end
      attr_accessor :regions_of_operation

      # The legal name of the organization as registered with the IRS or other relevant
      # authorities. For some applications, this will be matched against government
      # records and should include all punctuation and everything else as well.
      sig { returns(T.nilable(String)) }
      attr_accessor :registered_name

      # For publicly traded companies, this is the exchange on which the company's stock
      # is traded.
      sig do
        returns(T.nilable(SurgeAPI::Organization::StockExchange::TaggedSymbol))
      end
      attr_accessor :stock_exchange

      # For publicly traded companies, the ticker symbol for the company's stock
      sig { returns(T.nilable(String)) }
      attr_accessor :stock_symbol

      # The type of organization
      sig { returns(T.nilable(SurgeAPI::Organization::Type::TaggedSymbol)) }
      attr_accessor :type

      # The URL of the website for this organization. The website should be publicly
      # available, clearly reflect the organization's purpose, and the URL should start
      # with `https://`
      sig { returns(T.nilable(String)) }
      attr_accessor :website

      # The legal entity on whose behalf the account will be operated.
      sig do
        params(
          address: SurgeAPI::Organization::Address::OrHash,
          contact: SurgeAPI::Organization::Contact::OrHash,
          country: T.nilable(String),
          email: T.nilable(String),
          identifier: T.nilable(String),
          identifier_type:
            T.nilable(SurgeAPI::Organization::IdentifierType::OrSymbol),
          industry: T.nilable(SurgeAPI::Organization::Industry::OrSymbol),
          mobile_number: T.nilable(String),
          regions_of_operation:
            T.nilable(
              T::Array[SurgeAPI::Organization::RegionsOfOperation::OrSymbol]
            ),
          registered_name: T.nilable(String),
          stock_exchange:
            T.nilable(SurgeAPI::Organization::StockExchange::OrSymbol),
          stock_symbol: T.nilable(String),
          type: T.nilable(SurgeAPI::Organization::Type::OrSymbol),
          website: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The address of the organization's headquarters.
        address:,
        # An object representing an individual who can be contacted if the carriers have
        # any questions about the business.
        contact:,
        # The two character ISO 3166 country code for the country in which the
        # organization is headquartered.
        country:,
        # For publicly traded companies, an email for a representative of the company to
        # whom a verification email will be sent. This must be an email on the same domain
        # as the company's website (e.g. with a website domain of
        # `https://dtprecisionauto.com`, the email must use the same
        # `@dtprecisionauto.com`)
        email:,
        # The value of the identifier whose type is specified in the identifier_type
        # field. Typically this will be an EIN, and can be formatted with or without the
        # hyphen.
        identifier:,
        # The type of identifier being provided for the organization. Support for more
        # values will be added in the future.
        identifier_type:,
        # The industry in which the organization operates.
        industry:,
        # For sole proprietors, this must be a valid US mobile phone number to which a
        # verification text message will be sent. (E.164 format)
        mobile_number:,
        # An array of regions in which the organization operates.
        regions_of_operation:,
        # The legal name of the organization as registered with the IRS or other relevant
        # authorities. For some applications, this will be matched against government
        # records and should include all punctuation and everything else as well.
        registered_name:,
        # For publicly traded companies, this is the exchange on which the company's stock
        # is traded.
        stock_exchange:,
        # For publicly traded companies, the ticker symbol for the company's stock
        stock_symbol:,
        # The type of organization
        type:,
        # The URL of the website for this organization. The website should be publicly
        # available, clearly reflect the organization's purpose, and the URL should start
        # with `https://`
        website:
      )
      end

      sig do
        override.returns(
          {
            address: SurgeAPI::Organization::Address,
            contact: SurgeAPI::Organization::Contact,
            country: T.nilable(String),
            email: T.nilable(String),
            identifier: T.nilable(String),
            identifier_type:
              T.nilable(SurgeAPI::Organization::IdentifierType::TaggedSymbol),
            industry: T.nilable(SurgeAPI::Organization::Industry::TaggedSymbol),
            mobile_number: T.nilable(String),
            regions_of_operation:
              T.nilable(
                T::Array[
                  SurgeAPI::Organization::RegionsOfOperation::TaggedSymbol
                ]
              ),
            registered_name: T.nilable(String),
            stock_exchange:
              T.nilable(SurgeAPI::Organization::StockExchange::TaggedSymbol),
            stock_symbol: T.nilable(String),
            type: T.nilable(SurgeAPI::Organization::Type::TaggedSymbol),
            website: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Address < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(SurgeAPI::Organization::Address, SurgeAPI::Internal::AnyHash)
          end

        # The two character ISO 3166 country code. If none is provided, the organization's
        # country code will be used.
        sig { returns(T.nilable(String)) }
        attr_accessor :country

        # The first line of the address, typically the number and street name
        sig { returns(T.nilable(String)) }
        attr_accessor :line1

        # The second line of the address if needed, typically an apartment or suite number
        sig { returns(T.nilable(String)) }
        attr_accessor :line2

        # The city or locality
        sig { returns(T.nilable(String)) }
        attr_accessor :locality

        # The name to which any mail should be addressed. If none is provided, this will
        # default to the organization's registered_name
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # The postal code
        sig { returns(T.nilable(String)) }
        attr_accessor :postal_code

        # The state or region
        sig { returns(T.nilable(String)) }
        attr_accessor :region

        # The address of the organization's headquarters.
        sig do
          params(
            country: T.nilable(String),
            line1: T.nilable(String),
            line2: T.nilable(String),
            locality: T.nilable(String),
            name: T.nilable(String),
            postal_code: T.nilable(String),
            region: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The two character ISO 3166 country code. If none is provided, the organization's
          # country code will be used.
          country:,
          # The first line of the address, typically the number and street name
          line1:,
          # The second line of the address if needed, typically an apartment or suite number
          line2:,
          # The city or locality
          locality:,
          # The name to which any mail should be addressed. If none is provided, this will
          # default to the organization's registered_name
          name:,
          # The postal code
          postal_code:,
          # The state or region
          region:
        )
        end

        sig do
          override.returns(
            {
              country: T.nilable(String),
              line1: T.nilable(String),
              line2: T.nilable(String),
              locality: T.nilable(String),
              name: T.nilable(String),
              postal_code: T.nilable(String),
              region: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      class Contact < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(SurgeAPI::Organization::Contact, SurgeAPI::Internal::AnyHash)
          end

        # An email address at which the individual can be reached. Typically an email
        # using the same domain name as the website URL will be preferred (e.g. with a
        # website domain of `https://dtprecisionauto.com`, an email like
        # `dom@dtprecisionauto.com` will be preferred over one like
        # `dom@anothergarage.com` or `dom.toretto@gmail.com`)
        sig { returns(T.nilable(String)) }
        attr_accessor :email

        # The first name (or given name) of the individual
        sig { returns(T.nilable(String)) }
        attr_accessor :first_name

        # The last name (or family name) of the individual
        sig { returns(T.nilable(String)) }
        attr_accessor :last_name

        # A phone number at which the individual can be reached (E.164 format)
        sig { returns(T.nilable(String)) }
        attr_accessor :phone_number

        # The job title of the individual.
        sig do
          returns(
            T.nilable(SurgeAPI::Organization::Contact::Title::TaggedSymbol)
          )
        end
        attr_accessor :title

        # If `other` is provided for the `title` field, this field should be used to
        # provide the title of the individual
        sig { returns(T.nilable(String)) }
        attr_accessor :title_other

        # An object representing an individual who can be contacted if the carriers have
        # any questions about the business.
        sig do
          params(
            email: T.nilable(String),
            first_name: T.nilable(String),
            last_name: T.nilable(String),
            phone_number: T.nilable(String),
            title: T.nilable(SurgeAPI::Organization::Contact::Title::OrSymbol),
            title_other: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # An email address at which the individual can be reached. Typically an email
          # using the same domain name as the website URL will be preferred (e.g. with a
          # website domain of `https://dtprecisionauto.com`, an email like
          # `dom@dtprecisionauto.com` will be preferred over one like
          # `dom@anothergarage.com` or `dom.toretto@gmail.com`)
          email:,
          # The first name (or given name) of the individual
          first_name:,
          # The last name (or family name) of the individual
          last_name:,
          # A phone number at which the individual can be reached (E.164 format)
          phone_number:,
          # The job title of the individual.
          title:,
          # If `other` is provided for the `title` field, this field should be used to
          # provide the title of the individual
          title_other:
        )
        end

        sig do
          override.returns(
            {
              email: T.nilable(String),
              first_name: T.nilable(String),
              last_name: T.nilable(String),
              phone_number: T.nilable(String),
              title:
                T.nilable(SurgeAPI::Organization::Contact::Title::TaggedSymbol),
              title_other: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # The job title of the individual.
        module Title
          extend SurgeAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, SurgeAPI::Organization::Contact::Title)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CEO =
            T.let(:ceo, SurgeAPI::Organization::Contact::Title::TaggedSymbol)
          CFO =
            T.let(:cfo, SurgeAPI::Organization::Contact::Title::TaggedSymbol)
          DIRECTOR =
            T.let(
              :director,
              SurgeAPI::Organization::Contact::Title::TaggedSymbol
            )
          GM = T.let(:gm, SurgeAPI::Organization::Contact::Title::TaggedSymbol)
          VP = T.let(:vp, SurgeAPI::Organization::Contact::Title::TaggedSymbol)
          GENERAL_COUNSEL =
            T.let(
              :general_counsel,
              SurgeAPI::Organization::Contact::Title::TaggedSymbol
            )
          OTHER =
            T.let(:other, SurgeAPI::Organization::Contact::Title::TaggedSymbol)

          sig do
            override.returns(
              T::Array[SurgeAPI::Organization::Contact::Title::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      # The type of identifier being provided for the organization. Support for more
      # values will be added in the future.
      module IdentifierType
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SurgeAPI::Organization::IdentifierType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EIN = T.let(:ein, SurgeAPI::Organization::IdentifierType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[SurgeAPI::Organization::IdentifierType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The industry in which the organization operates.
      module Industry
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SurgeAPI::Organization::Industry) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AGRICULTURE =
          T.let(:agriculture, SurgeAPI::Organization::Industry::TaggedSymbol)
        AUTOMOTIVE =
          T.let(:automotive, SurgeAPI::Organization::Industry::TaggedSymbol)
        BANKING =
          T.let(:banking, SurgeAPI::Organization::Industry::TaggedSymbol)
        CONSTRUCTION =
          T.let(:construction, SurgeAPI::Organization::Industry::TaggedSymbol)
        CONSUMER =
          T.let(:consumer, SurgeAPI::Organization::Industry::TaggedSymbol)
        EDUCATION =
          T.let(:education, SurgeAPI::Organization::Industry::TaggedSymbol)
        ELECTRONICS =
          T.let(:electronics, SurgeAPI::Organization::Industry::TaggedSymbol)
        ENERGY = T.let(:energy, SurgeAPI::Organization::Industry::TaggedSymbol)
        ENGINEERING =
          T.let(:engineering, SurgeAPI::Organization::Industry::TaggedSymbol)
        FAST_MOVING_CONSUMER_GOODS =
          T.let(
            :fast_moving_consumer_goods,
            SurgeAPI::Organization::Industry::TaggedSymbol
          )
        FINANCIAL =
          T.let(:financial, SurgeAPI::Organization::Industry::TaggedSymbol)
        FINTECH =
          T.let(:fintech, SurgeAPI::Organization::Industry::TaggedSymbol)
        FOOD_AND_BEVERAGE =
          T.let(
            :food_and_beverage,
            SurgeAPI::Organization::Industry::TaggedSymbol
          )
        GOVERNMENT =
          T.let(:government, SurgeAPI::Organization::Industry::TaggedSymbol)
        HEALTHCARE =
          T.let(:healthcare, SurgeAPI::Organization::Industry::TaggedSymbol)
        HOSPITALITY =
          T.let(:hospitality, SurgeAPI::Organization::Industry::TaggedSymbol)
        INSURANCE =
          T.let(:insurance, SurgeAPI::Organization::Industry::TaggedSymbol)
        JEWELRY =
          T.let(:jewelry, SurgeAPI::Organization::Industry::TaggedSymbol)
        LEGAL = T.let(:legal, SurgeAPI::Organization::Industry::TaggedSymbol)
        MANUFACTURING =
          T.let(:manufacturing, SurgeAPI::Organization::Industry::TaggedSymbol)
        MEDIA = T.let(:media, SurgeAPI::Organization::Industry::TaggedSymbol)
        NOT_FOR_PROFIT =
          T.let(:not_for_profit, SurgeAPI::Organization::Industry::TaggedSymbol)
        OIL_AND_GAS =
          T.let(:oil_and_gas, SurgeAPI::Organization::Industry::TaggedSymbol)
        ONLINE = T.let(:online, SurgeAPI::Organization::Industry::TaggedSymbol)
        PROFESSIONAL_SERVICES =
          T.let(
            :professional_services,
            SurgeAPI::Organization::Industry::TaggedSymbol
          )
        RAW_MATERIALS =
          T.let(:raw_materials, SurgeAPI::Organization::Industry::TaggedSymbol)
        REAL_ESTATE =
          T.let(:real_estate, SurgeAPI::Organization::Industry::TaggedSymbol)
        RELIGION =
          T.let(:religion, SurgeAPI::Organization::Industry::TaggedSymbol)
        RETAIL = T.let(:retail, SurgeAPI::Organization::Industry::TaggedSymbol)
        TECHNOLOGY =
          T.let(:technology, SurgeAPI::Organization::Industry::TaggedSymbol)
        TELECOMMUNICATIONS =
          T.let(
            :telecommunications,
            SurgeAPI::Organization::Industry::TaggedSymbol
          )
        TRANSPORTATION =
          T.let(:transportation, SurgeAPI::Organization::Industry::TaggedSymbol)
        TRAVEL = T.let(:travel, SurgeAPI::Organization::Industry::TaggedSymbol)

        sig do
          override.returns(
            T::Array[SurgeAPI::Organization::Industry::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module RegionsOfOperation
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, SurgeAPI::Organization::RegionsOfOperation)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AFRICA =
          T.let(
            :africa,
            SurgeAPI::Organization::RegionsOfOperation::TaggedSymbol
          )
        ASIA =
          T.let(:asia, SurgeAPI::Organization::RegionsOfOperation::TaggedSymbol)
        AUSTRALIA =
          T.let(
            :australia,
            SurgeAPI::Organization::RegionsOfOperation::TaggedSymbol
          )
        EUROPE =
          T.let(
            :europe,
            SurgeAPI::Organization::RegionsOfOperation::TaggedSymbol
          )
        LATIN_AMERICA =
          T.let(
            :latin_america,
            SurgeAPI::Organization::RegionsOfOperation::TaggedSymbol
          )
        USA_AND_CANADA =
          T.let(
            :usa_and_canada,
            SurgeAPI::Organization::RegionsOfOperation::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[SurgeAPI::Organization::RegionsOfOperation::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # For publicly traded companies, this is the exchange on which the company's stock
      # is traded.
      module StockExchange
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SurgeAPI::Organization::StockExchange) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AMEX = T.let(:amex, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        AMX = T.let(:amx, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        ASX = T.let(:asx, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        B3 = T.let(:b3, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        BME = T.let(:bme, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        BSE = T.let(:bse, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        FRA = T.let(:fra, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        ICEX = T.let(:icex, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        JPX = T.let(:jpx, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        JSE = T.let(:jse, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        KRX = T.let(:krx, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        LON = T.let(:lon, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        NASDAQ =
          T.let(:nasdaq, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        NONE = T.let(:none, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        NYSE = T.let(:nyse, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        NSE = T.let(:nse, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        OMX = T.let(:omx, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        OTHER =
          T.let(:other, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        SEHK = T.let(:sehk, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        SGX = T.let(:sgx, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        SSE = T.let(:sse, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        STO = T.let(:sto, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        SWX = T.let(:swx, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        SZSE = T.let(:szse, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        TSX = T.let(:tsx, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        TWSE = T.let(:twse, SurgeAPI::Organization::StockExchange::TaggedSymbol)
        VSE = T.let(:vse, SurgeAPI::Organization::StockExchange::TaggedSymbol)

        sig do
          override.returns(
            T::Array[SurgeAPI::Organization::StockExchange::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The type of organization
      module Type
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SurgeAPI::Organization::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CO_OP = T.let(:co_op, SurgeAPI::Organization::Type::TaggedSymbol)
        GOVERNMENT =
          T.let(:government, SurgeAPI::Organization::Type::TaggedSymbol)
        LLC = T.let(:llc, SurgeAPI::Organization::Type::TaggedSymbol)
        NON_PROFIT =
          T.let(:non_profit, SurgeAPI::Organization::Type::TaggedSymbol)
        PARTNERSHIP =
          T.let(:partnership, SurgeAPI::Organization::Type::TaggedSymbol)
        PRIVATE_CORPORATION =
          T.let(
            :private_corporation,
            SurgeAPI::Organization::Type::TaggedSymbol
          )
        PUBLIC_CORPORATION =
          T.let(:public_corporation, SurgeAPI::Organization::Type::TaggedSymbol)
        SOLE_PROPRIETOR =
          T.let(:sole_proprietor, SurgeAPI::Organization::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[SurgeAPI::Organization::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
