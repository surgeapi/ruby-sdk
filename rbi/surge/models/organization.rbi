# typed: strong

module Surge
  module Models
    class Organization < Surge::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Surge::Organization, Surge::Internal::AnyHash) }

      # The address of the organization's headquarters.
      sig { returns(Surge::Organization::Address) }
      attr_reader :address

      sig { params(address: Surge::Organization::Address::OrHash).void }
      attr_writer :address

      # An object representing an individual who can be contacted if the carriers have
      # any questions about the business.
      sig { returns(Surge::Organization::Contact) }
      attr_reader :contact

      sig { params(contact: Surge::Organization::Contact::OrHash).void }
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
        returns(T.nilable(Surge::Organization::IdentifierType::TaggedSymbol))
      end
      attr_accessor :identifier_type

      # The industry in which the organization operates.
      sig { returns(T.nilable(Surge::Organization::Industry::TaggedSymbol)) }
      attr_accessor :industry

      # For sole proprietors, this must be a valid US mobile phone number to which a
      # verification text message will be sent. (E.164 format)
      sig { returns(T.nilable(String)) }
      attr_accessor :mobile_number

      # An array of regions in which the organization operates.
      sig do
        returns(
          T.nilable(
            T::Array[Surge::Organization::RegionsOfOperation::TaggedSymbol]
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
        returns(T.nilable(Surge::Organization::StockExchange::TaggedSymbol))
      end
      attr_accessor :stock_exchange

      # For publicly traded companies, the ticker symbol for the company's stock
      sig { returns(T.nilable(String)) }
      attr_accessor :stock_symbol

      # The type of organization
      sig { returns(T.nilable(Surge::Organization::Type::TaggedSymbol)) }
      attr_accessor :type

      # The URL of the website for this organization. The website should be publicly
      # available, clearly reflect the organization's purpose, and the URL should start
      # with `https://`
      sig { returns(T.nilable(String)) }
      attr_accessor :website

      # The legal entity on whose behalf the account will be operated.
      sig do
        params(
          address: Surge::Organization::Address::OrHash,
          contact: Surge::Organization::Contact::OrHash,
          country: T.nilable(String),
          email: T.nilable(String),
          identifier: T.nilable(String),
          identifier_type:
            T.nilable(Surge::Organization::IdentifierType::OrSymbol),
          industry: T.nilable(Surge::Organization::Industry::OrSymbol),
          mobile_number: T.nilable(String),
          regions_of_operation:
            T.nilable(
              T::Array[Surge::Organization::RegionsOfOperation::OrSymbol]
            ),
          registered_name: T.nilable(String),
          stock_exchange:
            T.nilable(Surge::Organization::StockExchange::OrSymbol),
          stock_symbol: T.nilable(String),
          type: T.nilable(Surge::Organization::Type::OrSymbol),
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
            address: Surge::Organization::Address,
            contact: Surge::Organization::Contact,
            country: T.nilable(String),
            email: T.nilable(String),
            identifier: T.nilable(String),
            identifier_type:
              T.nilable(Surge::Organization::IdentifierType::TaggedSymbol),
            industry: T.nilable(Surge::Organization::Industry::TaggedSymbol),
            mobile_number: T.nilable(String),
            regions_of_operation:
              T.nilable(
                T::Array[Surge::Organization::RegionsOfOperation::TaggedSymbol]
              ),
            registered_name: T.nilable(String),
            stock_exchange:
              T.nilable(Surge::Organization::StockExchange::TaggedSymbol),
            stock_symbol: T.nilable(String),
            type: T.nilable(Surge::Organization::Type::TaggedSymbol),
            website: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Address < Surge::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Surge::Organization::Address, Surge::Internal::AnyHash)
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

      class Contact < Surge::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Surge::Organization::Contact, Surge::Internal::AnyHash)
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
          returns(T.nilable(Surge::Organization::Contact::Title::TaggedSymbol))
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
            title: T.nilable(Surge::Organization::Contact::Title::OrSymbol),
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
                T.nilable(Surge::Organization::Contact::Title::TaggedSymbol),
              title_other: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # The job title of the individual.
        module Title
          extend Surge::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Surge::Organization::Contact::Title) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CEO = T.let(:ceo, Surge::Organization::Contact::Title::TaggedSymbol)
          CFO = T.let(:cfo, Surge::Organization::Contact::Title::TaggedSymbol)
          DIRECTOR =
            T.let(:director, Surge::Organization::Contact::Title::TaggedSymbol)
          GM = T.let(:gm, Surge::Organization::Contact::Title::TaggedSymbol)
          VP = T.let(:vp, Surge::Organization::Contact::Title::TaggedSymbol)
          GENERAL_COUNSEL =
            T.let(
              :general_counsel,
              Surge::Organization::Contact::Title::TaggedSymbol
            )
          OTHER =
            T.let(:other, Surge::Organization::Contact::Title::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Surge::Organization::Contact::Title::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      # The type of identifier being provided for the organization. Support for more
      # values will be added in the future.
      module IdentifierType
        extend Surge::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Surge::Organization::IdentifierType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EIN = T.let(:ein, Surge::Organization::IdentifierType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Surge::Organization::IdentifierType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The industry in which the organization operates.
      module Industry
        extend Surge::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Surge::Organization::Industry) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AGRICULTURE =
          T.let(:agriculture, Surge::Organization::Industry::TaggedSymbol)
        AUTOMOTIVE =
          T.let(:automotive, Surge::Organization::Industry::TaggedSymbol)
        BANKING = T.let(:banking, Surge::Organization::Industry::TaggedSymbol)
        CONSTRUCTION =
          T.let(:construction, Surge::Organization::Industry::TaggedSymbol)
        CONSUMER = T.let(:consumer, Surge::Organization::Industry::TaggedSymbol)
        EDUCATION =
          T.let(:education, Surge::Organization::Industry::TaggedSymbol)
        ELECTRONICS =
          T.let(:electronics, Surge::Organization::Industry::TaggedSymbol)
        ENERGY = T.let(:energy, Surge::Organization::Industry::TaggedSymbol)
        ENGINEERING =
          T.let(:engineering, Surge::Organization::Industry::TaggedSymbol)
        FAST_MOVING_CONSUMER_GOODS =
          T.let(
            :fast_moving_consumer_goods,
            Surge::Organization::Industry::TaggedSymbol
          )
        FINANCIAL =
          T.let(:financial, Surge::Organization::Industry::TaggedSymbol)
        FINTECH = T.let(:fintech, Surge::Organization::Industry::TaggedSymbol)
        FOOD_AND_BEVERAGE =
          T.let(:food_and_beverage, Surge::Organization::Industry::TaggedSymbol)
        GOVERNMENT =
          T.let(:government, Surge::Organization::Industry::TaggedSymbol)
        HEALTHCARE =
          T.let(:healthcare, Surge::Organization::Industry::TaggedSymbol)
        HOSPITALITY =
          T.let(:hospitality, Surge::Organization::Industry::TaggedSymbol)
        INSURANCE =
          T.let(:insurance, Surge::Organization::Industry::TaggedSymbol)
        JEWELRY = T.let(:jewelry, Surge::Organization::Industry::TaggedSymbol)
        LEGAL = T.let(:legal, Surge::Organization::Industry::TaggedSymbol)
        MANUFACTURING =
          T.let(:manufacturing, Surge::Organization::Industry::TaggedSymbol)
        MEDIA = T.let(:media, Surge::Organization::Industry::TaggedSymbol)
        NOT_FOR_PROFIT =
          T.let(:not_for_profit, Surge::Organization::Industry::TaggedSymbol)
        OIL_AND_GAS =
          T.let(:oil_and_gas, Surge::Organization::Industry::TaggedSymbol)
        ONLINE = T.let(:online, Surge::Organization::Industry::TaggedSymbol)
        PROFESSIONAL_SERVICES =
          T.let(
            :professional_services,
            Surge::Organization::Industry::TaggedSymbol
          )
        RAW_MATERIALS =
          T.let(:raw_materials, Surge::Organization::Industry::TaggedSymbol)
        REAL_ESTATE =
          T.let(:real_estate, Surge::Organization::Industry::TaggedSymbol)
        RELIGION = T.let(:religion, Surge::Organization::Industry::TaggedSymbol)
        RETAIL = T.let(:retail, Surge::Organization::Industry::TaggedSymbol)
        TECHNOLOGY =
          T.let(:technology, Surge::Organization::Industry::TaggedSymbol)
        TELECOMMUNICATIONS =
          T.let(
            :telecommunications,
            Surge::Organization::Industry::TaggedSymbol
          )
        TRANSPORTATION =
          T.let(:transportation, Surge::Organization::Industry::TaggedSymbol)
        TRAVEL = T.let(:travel, Surge::Organization::Industry::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Surge::Organization::Industry::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module RegionsOfOperation
        extend Surge::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Surge::Organization::RegionsOfOperation)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AFRICA =
          T.let(:africa, Surge::Organization::RegionsOfOperation::TaggedSymbol)
        ASIA =
          T.let(:asia, Surge::Organization::RegionsOfOperation::TaggedSymbol)
        AUSTRALIA =
          T.let(
            :australia,
            Surge::Organization::RegionsOfOperation::TaggedSymbol
          )
        EUROPE =
          T.let(:europe, Surge::Organization::RegionsOfOperation::TaggedSymbol)
        LATIN_AMERICA =
          T.let(
            :latin_america,
            Surge::Organization::RegionsOfOperation::TaggedSymbol
          )
        USA_AND_CANADA =
          T.let(
            :usa_and_canada,
            Surge::Organization::RegionsOfOperation::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Surge::Organization::RegionsOfOperation::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # For publicly traded companies, this is the exchange on which the company's stock
      # is traded.
      module StockExchange
        extend Surge::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Surge::Organization::StockExchange) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AMEX = T.let(:amex, Surge::Organization::StockExchange::TaggedSymbol)
        AMX = T.let(:amx, Surge::Organization::StockExchange::TaggedSymbol)
        ASX = T.let(:asx, Surge::Organization::StockExchange::TaggedSymbol)
        B3 = T.let(:b3, Surge::Organization::StockExchange::TaggedSymbol)
        BME = T.let(:bme, Surge::Organization::StockExchange::TaggedSymbol)
        BSE = T.let(:bse, Surge::Organization::StockExchange::TaggedSymbol)
        FRA = T.let(:fra, Surge::Organization::StockExchange::TaggedSymbol)
        ICEX = T.let(:icex, Surge::Organization::StockExchange::TaggedSymbol)
        JPX = T.let(:jpx, Surge::Organization::StockExchange::TaggedSymbol)
        JSE = T.let(:jse, Surge::Organization::StockExchange::TaggedSymbol)
        KRX = T.let(:krx, Surge::Organization::StockExchange::TaggedSymbol)
        LON = T.let(:lon, Surge::Organization::StockExchange::TaggedSymbol)
        NASDAQ =
          T.let(:nasdaq, Surge::Organization::StockExchange::TaggedSymbol)
        NONE = T.let(:none, Surge::Organization::StockExchange::TaggedSymbol)
        NYSE = T.let(:nyse, Surge::Organization::StockExchange::TaggedSymbol)
        NSE = T.let(:nse, Surge::Organization::StockExchange::TaggedSymbol)
        OMX = T.let(:omx, Surge::Organization::StockExchange::TaggedSymbol)
        OTHER = T.let(:other, Surge::Organization::StockExchange::TaggedSymbol)
        SEHK = T.let(:sehk, Surge::Organization::StockExchange::TaggedSymbol)
        SGX = T.let(:sgx, Surge::Organization::StockExchange::TaggedSymbol)
        SSE = T.let(:sse, Surge::Organization::StockExchange::TaggedSymbol)
        STO = T.let(:sto, Surge::Organization::StockExchange::TaggedSymbol)
        SWX = T.let(:swx, Surge::Organization::StockExchange::TaggedSymbol)
        SZSE = T.let(:szse, Surge::Organization::StockExchange::TaggedSymbol)
        TSX = T.let(:tsx, Surge::Organization::StockExchange::TaggedSymbol)
        TWSE = T.let(:twse, Surge::Organization::StockExchange::TaggedSymbol)
        VSE = T.let(:vse, Surge::Organization::StockExchange::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Surge::Organization::StockExchange::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The type of organization
      module Type
        extend Surge::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Surge::Organization::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CO_OP = T.let(:co_op, Surge::Organization::Type::TaggedSymbol)
        GOVERNMENT = T.let(:government, Surge::Organization::Type::TaggedSymbol)
        LLC = T.let(:llc, Surge::Organization::Type::TaggedSymbol)
        NON_PROFIT = T.let(:non_profit, Surge::Organization::Type::TaggedSymbol)
        PARTNERSHIP =
          T.let(:partnership, Surge::Organization::Type::TaggedSymbol)
        PRIVATE_CORPORATION =
          T.let(:private_corporation, Surge::Organization::Type::TaggedSymbol)
        PUBLIC_CORPORATION =
          T.let(:public_corporation, Surge::Organization::Type::TaggedSymbol)
        SOLE_PROPRIETOR =
          T.let(:sole_proprietor, Surge::Organization::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Surge::Organization::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
