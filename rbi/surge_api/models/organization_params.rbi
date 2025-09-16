# typed: strong

module SurgeAPI
  module Models
    class OrganizationParams < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SurgeAPI::OrganizationParams, SurgeAPI::Internal::AnyHash)
        end

      # The address of the organization's headquarters.
      sig { returns(T.nilable(SurgeAPI::OrganizationParams::Address)) }
      attr_reader :address

      sig do
        params(address: SurgeAPI::OrganizationParams::Address::OrHash).void
      end
      attr_writer :address

      # An object representing an individual who can be contacted if the carriers have
      # any questions about the business.
      sig { returns(T.nilable(SurgeAPI::OrganizationParams::Contact)) }
      attr_reader :contact

      sig do
        params(
          contact: T.nilable(SurgeAPI::OrganizationParams::Contact::OrHash)
        ).void
      end
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
        returns(
          T.nilable(SurgeAPI::OrganizationParams::IdentifierType::OrSymbol)
        )
      end
      attr_accessor :identifier_type

      # The industry in which the organization operates.
      sig do
        returns(T.nilable(SurgeAPI::OrganizationParams::Industry::OrSymbol))
      end
      attr_accessor :industry

      # For sole proprietors, this must be a valid US mobile phone number to which a
      # verification text message will be sent. (E.164 format)
      sig { returns(T.nilable(String)) }
      attr_accessor :mobile_number

      # An array of regions in which the organization operates.
      sig do
        returns(
          T.nilable(
            T::Array[SurgeAPI::OrganizationParams::RegionsOfOperation::OrSymbol]
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
        returns(
          T.nilable(SurgeAPI::OrganizationParams::StockExchange::OrSymbol)
        )
      end
      attr_accessor :stock_exchange

      # For publicly traded companies, the ticker symbol for the company's stock
      sig { returns(T.nilable(String)) }
      attr_accessor :stock_symbol

      # The type of organization
      sig { returns(T.nilable(SurgeAPI::OrganizationParams::Type::OrSymbol)) }
      attr_accessor :type

      # The URL of the website for this organization. The website should be publicly
      # available, clearly reflect the organization's purpose, and the URL should start
      # with `https://`
      sig { returns(T.nilable(String)) }
      attr_accessor :website

      # Parameters describing the legal entity on whose behalf the account will be
      # operated.
      sig do
        params(
          address: SurgeAPI::OrganizationParams::Address::OrHash,
          contact: T.nilable(SurgeAPI::OrganizationParams::Contact::OrHash),
          country: T.nilable(String),
          email: T.nilable(String),
          identifier: T.nilable(String),
          identifier_type:
            T.nilable(SurgeAPI::OrganizationParams::IdentifierType::OrSymbol),
          industry: T.nilable(SurgeAPI::OrganizationParams::Industry::OrSymbol),
          mobile_number: T.nilable(String),
          regions_of_operation:
            T.nilable(
              T::Array[
                SurgeAPI::OrganizationParams::RegionsOfOperation::OrSymbol
              ]
            ),
          registered_name: T.nilable(String),
          stock_exchange:
            T.nilable(SurgeAPI::OrganizationParams::StockExchange::OrSymbol),
          stock_symbol: T.nilable(String),
          type: T.nilable(SurgeAPI::OrganizationParams::Type::OrSymbol),
          website: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The address of the organization's headquarters.
        address: nil,
        # An object representing an individual who can be contacted if the carriers have
        # any questions about the business.
        contact: nil,
        # The two character ISO 3166 country code for the country in which the
        # organization is headquartered.
        country: nil,
        # For publicly traded companies, an email for a representative of the company to
        # whom a verification email will be sent. This must be an email on the same domain
        # as the company's website (e.g. with a website domain of
        # `https://dtprecisionauto.com`, the email must use the same
        # `@dtprecisionauto.com`)
        email: nil,
        # The value of the identifier whose type is specified in the identifier_type
        # field. Typically this will be an EIN, and can be formatted with or without the
        # hyphen.
        identifier: nil,
        # The type of identifier being provided for the organization. Support for more
        # values will be added in the future.
        identifier_type: nil,
        # The industry in which the organization operates.
        industry: nil,
        # For sole proprietors, this must be a valid US mobile phone number to which a
        # verification text message will be sent. (E.164 format)
        mobile_number: nil,
        # An array of regions in which the organization operates.
        regions_of_operation: nil,
        # The legal name of the organization as registered with the IRS or other relevant
        # authorities. For some applications, this will be matched against government
        # records and should include all punctuation and everything else as well.
        registered_name: nil,
        # For publicly traded companies, this is the exchange on which the company's stock
        # is traded.
        stock_exchange: nil,
        # For publicly traded companies, the ticker symbol for the company's stock
        stock_symbol: nil,
        # The type of organization
        type: nil,
        # The URL of the website for this organization. The website should be publicly
        # available, clearly reflect the organization's purpose, and the URL should start
        # with `https://`
        website: nil
      )
      end

      sig do
        override.returns(
          {
            address: SurgeAPI::OrganizationParams::Address,
            contact: T.nilable(SurgeAPI::OrganizationParams::Contact),
            country: T.nilable(String),
            email: T.nilable(String),
            identifier: T.nilable(String),
            identifier_type:
              T.nilable(SurgeAPI::OrganizationParams::IdentifierType::OrSymbol),
            industry:
              T.nilable(SurgeAPI::OrganizationParams::Industry::OrSymbol),
            mobile_number: T.nilable(String),
            regions_of_operation:
              T.nilable(
                T::Array[
                  SurgeAPI::OrganizationParams::RegionsOfOperation::OrSymbol
                ]
              ),
            registered_name: T.nilable(String),
            stock_exchange:
              T.nilable(SurgeAPI::OrganizationParams::StockExchange::OrSymbol),
            stock_symbol: T.nilable(String),
            type: T.nilable(SurgeAPI::OrganizationParams::Type::OrSymbol),
            website: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Address < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::OrganizationParams::Address,
              SurgeAPI::Internal::AnyHash
            )
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
          country: nil,
          # The first line of the address, typically the number and street name
          line1: nil,
          # The second line of the address if needed, typically an apartment or suite number
          line2: nil,
          # The city or locality
          locality: nil,
          # The name to which any mail should be addressed. If none is provided, this will
          # default to the organization's registered_name
          name: nil,
          # The postal code
          postal_code: nil,
          # The state or region
          region: nil
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
            T.any(
              SurgeAPI::OrganizationParams::Contact,
              SurgeAPI::Internal::AnyHash
            )
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
            T.nilable(SurgeAPI::OrganizationParams::Contact::Title::OrSymbol)
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
            title:
              T.nilable(SurgeAPI::OrganizationParams::Contact::Title::OrSymbol),
            title_other: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # An email address at which the individual can be reached. Typically an email
          # using the same domain name as the website URL will be preferred (e.g. with a
          # website domain of `https://dtprecisionauto.com`, an email like
          # `dom@dtprecisionauto.com` will be preferred over one like
          # `dom@anothergarage.com` or `dom.toretto@gmail.com`)
          email: nil,
          # The first name (or given name) of the individual
          first_name: nil,
          # The last name (or family name) of the individual
          last_name: nil,
          # A phone number at which the individual can be reached (E.164 format)
          phone_number: nil,
          # The job title of the individual.
          title: nil,
          # If `other` is provided for the `title` field, this field should be used to
          # provide the title of the individual
          title_other: nil
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
                T.nilable(
                  SurgeAPI::OrganizationParams::Contact::Title::OrSymbol
                ),
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
              T.all(Symbol, SurgeAPI::OrganizationParams::Contact::Title)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CEO =
            T.let(
              :ceo,
              SurgeAPI::OrganizationParams::Contact::Title::TaggedSymbol
            )
          CFO =
            T.let(
              :cfo,
              SurgeAPI::OrganizationParams::Contact::Title::TaggedSymbol
            )
          DIRECTOR =
            T.let(
              :director,
              SurgeAPI::OrganizationParams::Contact::Title::TaggedSymbol
            )
          GM =
            T.let(
              :gm,
              SurgeAPI::OrganizationParams::Contact::Title::TaggedSymbol
            )
          VP =
            T.let(
              :vp,
              SurgeAPI::OrganizationParams::Contact::Title::TaggedSymbol
            )
          GENERAL_COUNSEL =
            T.let(
              :general_counsel,
              SurgeAPI::OrganizationParams::Contact::Title::TaggedSymbol
            )
          OTHER =
            T.let(
              :other,
              SurgeAPI::OrganizationParams::Contact::Title::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::OrganizationParams::Contact::Title::TaggedSymbol
              ]
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
          T.type_alias do
            T.all(Symbol, SurgeAPI::OrganizationParams::IdentifierType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EIN =
          T.let(
            :ein,
            SurgeAPI::OrganizationParams::IdentifierType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[SurgeAPI::OrganizationParams::IdentifierType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The industry in which the organization operates.
      module Industry
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SurgeAPI::OrganizationParams::Industry) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AGRICULTURE =
          T.let(
            :agriculture,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        AUTOMOTIVE =
          T.let(
            :automotive,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        BANKING =
          T.let(:banking, SurgeAPI::OrganizationParams::Industry::TaggedSymbol)
        CONSTRUCTION =
          T.let(
            :construction,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        CONSUMER =
          T.let(:consumer, SurgeAPI::OrganizationParams::Industry::TaggedSymbol)
        EDUCATION =
          T.let(
            :education,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        ELECTRONICS =
          T.let(
            :electronics,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        ENERGY =
          T.let(:energy, SurgeAPI::OrganizationParams::Industry::TaggedSymbol)
        ENGINEERING =
          T.let(
            :engineering,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        FAST_MOVING_CONSUMER_GOODS =
          T.let(
            :fast_moving_consumer_goods,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        FINANCIAL =
          T.let(
            :financial,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        FINTECH =
          T.let(:fintech, SurgeAPI::OrganizationParams::Industry::TaggedSymbol)
        FOOD_AND_BEVERAGE =
          T.let(
            :food_and_beverage,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        GOVERNMENT =
          T.let(
            :government,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        HEALTHCARE =
          T.let(
            :healthcare,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        HOSPITALITY =
          T.let(
            :hospitality,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        INSURANCE =
          T.let(
            :insurance,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        JEWELRY =
          T.let(:jewelry, SurgeAPI::OrganizationParams::Industry::TaggedSymbol)
        LEGAL =
          T.let(:legal, SurgeAPI::OrganizationParams::Industry::TaggedSymbol)
        MANUFACTURING =
          T.let(
            :manufacturing,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        MEDIA =
          T.let(:media, SurgeAPI::OrganizationParams::Industry::TaggedSymbol)
        NOT_FOR_PROFIT =
          T.let(
            :not_for_profit,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        OIL_AND_GAS =
          T.let(
            :oil_and_gas,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        ONLINE =
          T.let(:online, SurgeAPI::OrganizationParams::Industry::TaggedSymbol)
        PROFESSIONAL_SERVICES =
          T.let(
            :professional_services,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        RAW_MATERIALS =
          T.let(
            :raw_materials,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        REAL_ESTATE =
          T.let(
            :real_estate,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        RELIGION =
          T.let(:religion, SurgeAPI::OrganizationParams::Industry::TaggedSymbol)
        RETAIL =
          T.let(:retail, SurgeAPI::OrganizationParams::Industry::TaggedSymbol)
        TECHNOLOGY =
          T.let(
            :technology,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        TELECOMMUNICATIONS =
          T.let(
            :telecommunications,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        TRANSPORTATION =
          T.let(
            :transportation,
            SurgeAPI::OrganizationParams::Industry::TaggedSymbol
          )
        TRAVEL =
          T.let(:travel, SurgeAPI::OrganizationParams::Industry::TaggedSymbol)

        sig do
          override.returns(
            T::Array[SurgeAPI::OrganizationParams::Industry::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module RegionsOfOperation
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, SurgeAPI::OrganizationParams::RegionsOfOperation)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AFRICA =
          T.let(
            :africa,
            SurgeAPI::OrganizationParams::RegionsOfOperation::TaggedSymbol
          )
        ASIA =
          T.let(
            :asia,
            SurgeAPI::OrganizationParams::RegionsOfOperation::TaggedSymbol
          )
        AUSTRALIA =
          T.let(
            :australia,
            SurgeAPI::OrganizationParams::RegionsOfOperation::TaggedSymbol
          )
        EUROPE =
          T.let(
            :europe,
            SurgeAPI::OrganizationParams::RegionsOfOperation::TaggedSymbol
          )
        LATIN_AMERICA =
          T.let(
            :latin_america,
            SurgeAPI::OrganizationParams::RegionsOfOperation::TaggedSymbol
          )
        USA_AND_CANADA =
          T.let(
            :usa_and_canada,
            SurgeAPI::OrganizationParams::RegionsOfOperation::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              SurgeAPI::OrganizationParams::RegionsOfOperation::TaggedSymbol
            ]
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
          T.type_alias do
            T.all(Symbol, SurgeAPI::OrganizationParams::StockExchange)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AMEX =
          T.let(
            :amex,
            SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol
          )
        AMX =
          T.let(:amx, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        ASX =
          T.let(:asx, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        B3 =
          T.let(:b3, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        BME =
          T.let(:bme, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        BSE =
          T.let(:bse, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        FRA =
          T.let(:fra, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        ICEX =
          T.let(
            :icex,
            SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol
          )
        JPX =
          T.let(:jpx, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        JSE =
          T.let(:jse, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        KRX =
          T.let(:krx, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        LON =
          T.let(:lon, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        NASDAQ =
          T.let(
            :nasdaq,
            SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol
          )
        NONE =
          T.let(
            :none,
            SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol
          )
        NYSE =
          T.let(
            :nyse,
            SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol
          )
        NSE =
          T.let(:nse, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        OMX =
          T.let(:omx, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        OTHER =
          T.let(
            :other,
            SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol
          )
        SEHK =
          T.let(
            :sehk,
            SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol
          )
        SGX =
          T.let(:sgx, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        SSE =
          T.let(:sse, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        STO =
          T.let(:sto, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        SWX =
          T.let(:swx, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        SZSE =
          T.let(
            :szse,
            SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol
          )
        TSX =
          T.let(:tsx, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)
        TWSE =
          T.let(
            :twse,
            SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol
          )
        VSE =
          T.let(:vse, SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol)

        sig do
          override.returns(
            T::Array[SurgeAPI::OrganizationParams::StockExchange::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The type of organization
      module Type
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SurgeAPI::OrganizationParams::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CO_OP = T.let(:co_op, SurgeAPI::OrganizationParams::Type::TaggedSymbol)
        GOVERNMENT =
          T.let(:government, SurgeAPI::OrganizationParams::Type::TaggedSymbol)
        LLC = T.let(:llc, SurgeAPI::OrganizationParams::Type::TaggedSymbol)
        NON_PROFIT =
          T.let(:non_profit, SurgeAPI::OrganizationParams::Type::TaggedSymbol)
        PARTNERSHIP =
          T.let(:partnership, SurgeAPI::OrganizationParams::Type::TaggedSymbol)
        PRIVATE_CORPORATION =
          T.let(
            :private_corporation,
            SurgeAPI::OrganizationParams::Type::TaggedSymbol
          )
        PUBLIC_CORPORATION =
          T.let(
            :public_corporation,
            SurgeAPI::OrganizationParams::Type::TaggedSymbol
          )
        SOLE_PROPRIETOR =
          T.let(
            :sole_proprietor,
            SurgeAPI::OrganizationParams::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[SurgeAPI::OrganizationParams::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
