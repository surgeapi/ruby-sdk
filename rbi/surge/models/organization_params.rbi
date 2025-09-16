# typed: strong

module Surge
  module Models
    class OrganizationParams < Surge::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Surge::OrganizationParams, Surge::Internal::AnyHash)
        end

      # The address of the organization's headquarters.
      sig { returns(T.nilable(Surge::OrganizationParams::Address)) }
      attr_reader :address

      sig { params(address: Surge::OrganizationParams::Address::OrHash).void }
      attr_writer :address

      # An object representing an individual who can be contacted if the carriers have
      # any questions about the business.
      sig { returns(T.nilable(Surge::OrganizationParams::Contact)) }
      attr_reader :contact

      sig do
        params(
          contact: T.nilable(Surge::OrganizationParams::Contact::OrHash)
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
        returns(T.nilable(Surge::OrganizationParams::IdentifierType::OrSymbol))
      end
      attr_accessor :identifier_type

      # The industry in which the organization operates.
      sig { returns(T.nilable(Surge::OrganizationParams::Industry::OrSymbol)) }
      attr_accessor :industry

      # For sole proprietors, this must be a valid US mobile phone number to which a
      # verification text message will be sent. (E.164 format)
      sig { returns(T.nilable(String)) }
      attr_accessor :mobile_number

      # An array of regions in which the organization operates.
      sig do
        returns(
          T.nilable(
            T::Array[Surge::OrganizationParams::RegionsOfOperation::OrSymbol]
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
        returns(T.nilable(Surge::OrganizationParams::StockExchange::OrSymbol))
      end
      attr_accessor :stock_exchange

      # For publicly traded companies, the ticker symbol for the company's stock
      sig { returns(T.nilable(String)) }
      attr_accessor :stock_symbol

      # The type of organization
      sig { returns(T.nilable(Surge::OrganizationParams::Type::OrSymbol)) }
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
          address: Surge::OrganizationParams::Address::OrHash,
          contact: T.nilable(Surge::OrganizationParams::Contact::OrHash),
          country: T.nilable(String),
          email: T.nilable(String),
          identifier: T.nilable(String),
          identifier_type:
            T.nilable(Surge::OrganizationParams::IdentifierType::OrSymbol),
          industry: T.nilable(Surge::OrganizationParams::Industry::OrSymbol),
          mobile_number: T.nilable(String),
          regions_of_operation:
            T.nilable(
              T::Array[Surge::OrganizationParams::RegionsOfOperation::OrSymbol]
            ),
          registered_name: T.nilable(String),
          stock_exchange:
            T.nilable(Surge::OrganizationParams::StockExchange::OrSymbol),
          stock_symbol: T.nilable(String),
          type: T.nilable(Surge::OrganizationParams::Type::OrSymbol),
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
            address: Surge::OrganizationParams::Address,
            contact: T.nilable(Surge::OrganizationParams::Contact),
            country: T.nilable(String),
            email: T.nilable(String),
            identifier: T.nilable(String),
            identifier_type:
              T.nilable(Surge::OrganizationParams::IdentifierType::OrSymbol),
            industry: T.nilable(Surge::OrganizationParams::Industry::OrSymbol),
            mobile_number: T.nilable(String),
            regions_of_operation:
              T.nilable(
                T::Array[
                  Surge::OrganizationParams::RegionsOfOperation::OrSymbol
                ]
              ),
            registered_name: T.nilable(String),
            stock_exchange:
              T.nilable(Surge::OrganizationParams::StockExchange::OrSymbol),
            stock_symbol: T.nilable(String),
            type: T.nilable(Surge::OrganizationParams::Type::OrSymbol),
            website: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Address < Surge::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Surge::OrganizationParams::Address, Surge::Internal::AnyHash)
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

      class Contact < Surge::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Surge::OrganizationParams::Contact, Surge::Internal::AnyHash)
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
            T.nilable(Surge::OrganizationParams::Contact::Title::OrSymbol)
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
              T.nilable(Surge::OrganizationParams::Contact::Title::OrSymbol),
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
                T.nilable(Surge::OrganizationParams::Contact::Title::OrSymbol),
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
            T.type_alias do
              T.all(Symbol, Surge::OrganizationParams::Contact::Title)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CEO =
            T.let(:ceo, Surge::OrganizationParams::Contact::Title::TaggedSymbol)
          CFO =
            T.let(:cfo, Surge::OrganizationParams::Contact::Title::TaggedSymbol)
          DIRECTOR =
            T.let(
              :director,
              Surge::OrganizationParams::Contact::Title::TaggedSymbol
            )
          GM =
            T.let(:gm, Surge::OrganizationParams::Contact::Title::TaggedSymbol)
          VP =
            T.let(:vp, Surge::OrganizationParams::Contact::Title::TaggedSymbol)
          GENERAL_COUNSEL =
            T.let(
              :general_counsel,
              Surge::OrganizationParams::Contact::Title::TaggedSymbol
            )
          OTHER =
            T.let(
              :other,
              Surge::OrganizationParams::Contact::Title::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Surge::OrganizationParams::Contact::Title::TaggedSymbol]
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
          T.type_alias do
            T.all(Symbol, Surge::OrganizationParams::IdentifierType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EIN =
          T.let(:ein, Surge::OrganizationParams::IdentifierType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Surge::OrganizationParams::IdentifierType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The industry in which the organization operates.
      module Industry
        extend Surge::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Surge::OrganizationParams::Industry) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AGRICULTURE =
          T.let(:agriculture, Surge::OrganizationParams::Industry::TaggedSymbol)
        AUTOMOTIVE =
          T.let(:automotive, Surge::OrganizationParams::Industry::TaggedSymbol)
        BANKING =
          T.let(:banking, Surge::OrganizationParams::Industry::TaggedSymbol)
        CONSTRUCTION =
          T.let(
            :construction,
            Surge::OrganizationParams::Industry::TaggedSymbol
          )
        CONSUMER =
          T.let(:consumer, Surge::OrganizationParams::Industry::TaggedSymbol)
        EDUCATION =
          T.let(:education, Surge::OrganizationParams::Industry::TaggedSymbol)
        ELECTRONICS =
          T.let(:electronics, Surge::OrganizationParams::Industry::TaggedSymbol)
        ENERGY =
          T.let(:energy, Surge::OrganizationParams::Industry::TaggedSymbol)
        ENGINEERING =
          T.let(:engineering, Surge::OrganizationParams::Industry::TaggedSymbol)
        FAST_MOVING_CONSUMER_GOODS =
          T.let(
            :fast_moving_consumer_goods,
            Surge::OrganizationParams::Industry::TaggedSymbol
          )
        FINANCIAL =
          T.let(:financial, Surge::OrganizationParams::Industry::TaggedSymbol)
        FINTECH =
          T.let(:fintech, Surge::OrganizationParams::Industry::TaggedSymbol)
        FOOD_AND_BEVERAGE =
          T.let(
            :food_and_beverage,
            Surge::OrganizationParams::Industry::TaggedSymbol
          )
        GOVERNMENT =
          T.let(:government, Surge::OrganizationParams::Industry::TaggedSymbol)
        HEALTHCARE =
          T.let(:healthcare, Surge::OrganizationParams::Industry::TaggedSymbol)
        HOSPITALITY =
          T.let(:hospitality, Surge::OrganizationParams::Industry::TaggedSymbol)
        INSURANCE =
          T.let(:insurance, Surge::OrganizationParams::Industry::TaggedSymbol)
        JEWELRY =
          T.let(:jewelry, Surge::OrganizationParams::Industry::TaggedSymbol)
        LEGAL = T.let(:legal, Surge::OrganizationParams::Industry::TaggedSymbol)
        MANUFACTURING =
          T.let(
            :manufacturing,
            Surge::OrganizationParams::Industry::TaggedSymbol
          )
        MEDIA = T.let(:media, Surge::OrganizationParams::Industry::TaggedSymbol)
        NOT_FOR_PROFIT =
          T.let(
            :not_for_profit,
            Surge::OrganizationParams::Industry::TaggedSymbol
          )
        OIL_AND_GAS =
          T.let(:oil_and_gas, Surge::OrganizationParams::Industry::TaggedSymbol)
        ONLINE =
          T.let(:online, Surge::OrganizationParams::Industry::TaggedSymbol)
        PROFESSIONAL_SERVICES =
          T.let(
            :professional_services,
            Surge::OrganizationParams::Industry::TaggedSymbol
          )
        RAW_MATERIALS =
          T.let(
            :raw_materials,
            Surge::OrganizationParams::Industry::TaggedSymbol
          )
        REAL_ESTATE =
          T.let(:real_estate, Surge::OrganizationParams::Industry::TaggedSymbol)
        RELIGION =
          T.let(:religion, Surge::OrganizationParams::Industry::TaggedSymbol)
        RETAIL =
          T.let(:retail, Surge::OrganizationParams::Industry::TaggedSymbol)
        TECHNOLOGY =
          T.let(:technology, Surge::OrganizationParams::Industry::TaggedSymbol)
        TELECOMMUNICATIONS =
          T.let(
            :telecommunications,
            Surge::OrganizationParams::Industry::TaggedSymbol
          )
        TRANSPORTATION =
          T.let(
            :transportation,
            Surge::OrganizationParams::Industry::TaggedSymbol
          )
        TRAVEL =
          T.let(:travel, Surge::OrganizationParams::Industry::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Surge::OrganizationParams::Industry::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module RegionsOfOperation
        extend Surge::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Surge::OrganizationParams::RegionsOfOperation)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AFRICA =
          T.let(
            :africa,
            Surge::OrganizationParams::RegionsOfOperation::TaggedSymbol
          )
        ASIA =
          T.let(
            :asia,
            Surge::OrganizationParams::RegionsOfOperation::TaggedSymbol
          )
        AUSTRALIA =
          T.let(
            :australia,
            Surge::OrganizationParams::RegionsOfOperation::TaggedSymbol
          )
        EUROPE =
          T.let(
            :europe,
            Surge::OrganizationParams::RegionsOfOperation::TaggedSymbol
          )
        LATIN_AMERICA =
          T.let(
            :latin_america,
            Surge::OrganizationParams::RegionsOfOperation::TaggedSymbol
          )
        USA_AND_CANADA =
          T.let(
            :usa_and_canada,
            Surge::OrganizationParams::RegionsOfOperation::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Surge::OrganizationParams::RegionsOfOperation::TaggedSymbol
            ]
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
          T.type_alias do
            T.all(Symbol, Surge::OrganizationParams::StockExchange)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AMEX =
          T.let(:amex, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        AMX =
          T.let(:amx, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        ASX =
          T.let(:asx, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        B3 = T.let(:b3, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        BME =
          T.let(:bme, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        BSE =
          T.let(:bse, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        FRA =
          T.let(:fra, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        ICEX =
          T.let(:icex, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        JPX =
          T.let(:jpx, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        JSE =
          T.let(:jse, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        KRX =
          T.let(:krx, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        LON =
          T.let(:lon, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        NASDAQ =
          T.let(:nasdaq, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        NONE =
          T.let(:none, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        NYSE =
          T.let(:nyse, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        NSE =
          T.let(:nse, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        OMX =
          T.let(:omx, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        OTHER =
          T.let(:other, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        SEHK =
          T.let(:sehk, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        SGX =
          T.let(:sgx, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        SSE =
          T.let(:sse, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        STO =
          T.let(:sto, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        SWX =
          T.let(:swx, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        SZSE =
          T.let(:szse, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        TSX =
          T.let(:tsx, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        TWSE =
          T.let(:twse, Surge::OrganizationParams::StockExchange::TaggedSymbol)
        VSE =
          T.let(:vse, Surge::OrganizationParams::StockExchange::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Surge::OrganizationParams::StockExchange::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The type of organization
      module Type
        extend Surge::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Surge::OrganizationParams::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CO_OP = T.let(:co_op, Surge::OrganizationParams::Type::TaggedSymbol)
        GOVERNMENT =
          T.let(:government, Surge::OrganizationParams::Type::TaggedSymbol)
        LLC = T.let(:llc, Surge::OrganizationParams::Type::TaggedSymbol)
        NON_PROFIT =
          T.let(:non_profit, Surge::OrganizationParams::Type::TaggedSymbol)
        PARTNERSHIP =
          T.let(:partnership, Surge::OrganizationParams::Type::TaggedSymbol)
        PRIVATE_CORPORATION =
          T.let(
            :private_corporation,
            Surge::OrganizationParams::Type::TaggedSymbol
          )
        PUBLIC_CORPORATION =
          T.let(
            :public_corporation,
            Surge::OrganizationParams::Type::TaggedSymbol
          )
        SOLE_PROPRIETOR =
          T.let(:sole_proprietor, Surge::OrganizationParams::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Surge::OrganizationParams::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
