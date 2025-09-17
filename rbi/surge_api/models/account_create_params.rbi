# typed: strong

module SurgeAPI
  module Models
    class AccountCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::AccountCreateParams, SurgeAPI::Internal::AnyHash)
        end

      # The name of the account that will be visible for your internal organizational
      # purposes. This will also be the default public-facing brand name unless you also
      # set a `brand_name`, but otherwise the account name will never be displayed
      # anywhere outside of Surge HQ, and may include your ID for the account or
      # anything else that may help you.
      sig { returns(String) }
      attr_accessor :name

      # The name by which the people this account communicates with know it. If not
      # provided, this will match the name field.
      sig { returns(T.nilable(String)) }
      attr_accessor :brand_name

      # Parameters describing the legal entity on whose behalf the account will be
      # operated.
      sig { returns(T.nilable(SurgeAPI::AccountCreateParams::Organization)) }
      attr_reader :organization

      sig do
        params(
          organization: SurgeAPI::AccountCreateParams::Organization::OrHash
        ).void
      end
      attr_writer :organization

      # This is the time zone in which the account is headquartered. This time zone may
      # be used for compliance with TCPA restrictions on when messages may be sent.
      sig { returns(T.nilable(String)) }
      attr_reader :time_zone

      sig { params(time_zone: String).void }
      attr_writer :time_zone

      sig do
        params(
          name: String,
          brand_name: T.nilable(String),
          organization: SurgeAPI::AccountCreateParams::Organization::OrHash,
          time_zone: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The name of the account that will be visible for your internal organizational
        # purposes. This will also be the default public-facing brand name unless you also
        # set a `brand_name`, but otherwise the account name will never be displayed
        # anywhere outside of Surge HQ, and may include your ID for the account or
        # anything else that may help you.
        name:,
        # The name by which the people this account communicates with know it. If not
        # provided, this will match the name field.
        brand_name: nil,
        # Parameters describing the legal entity on whose behalf the account will be
        # operated.
        organization: nil,
        # This is the time zone in which the account is headquartered. This time zone may
        # be used for compliance with TCPA restrictions on when messages may be sent.
        time_zone: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            brand_name: T.nilable(String),
            organization: SurgeAPI::AccountCreateParams::Organization,
            time_zone: String,
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Organization < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::AccountCreateParams::Organization,
              SurgeAPI::Internal::AnyHash
            )
          end

        # The address of the organization's headquarters.
        sig do
          returns(
            T.nilable(SurgeAPI::AccountCreateParams::Organization::Address)
          )
        end
        attr_reader :address

        sig do
          params(
            address:
              SurgeAPI::AccountCreateParams::Organization::Address::OrHash
          ).void
        end
        attr_writer :address

        # An object representing an individual who can be contacted if the carriers have
        # any questions about the business.
        sig do
          returns(
            T.nilable(SurgeAPI::AccountCreateParams::Organization::Contact)
          )
        end
        attr_reader :contact

        sig do
          params(
            contact:
              T.nilable(
                SurgeAPI::AccountCreateParams::Organization::Contact::OrHash
              )
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
            T.nilable(
              SurgeAPI::AccountCreateParams::Organization::IdentifierType::OrSymbol
            )
          )
        end
        attr_accessor :identifier_type

        # The industry in which the organization operates.
        sig do
          returns(
            T.nilable(
              SurgeAPI::AccountCreateParams::Organization::Industry::OrSymbol
            )
          )
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
              T::Array[
                SurgeAPI::AccountCreateParams::Organization::RegionsOfOperation::OrSymbol
              ]
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
            T.nilable(
              SurgeAPI::AccountCreateParams::Organization::StockExchange::OrSymbol
            )
          )
        end
        attr_accessor :stock_exchange

        # For publicly traded companies, the ticker symbol for the company's stock
        sig { returns(T.nilable(String)) }
        attr_accessor :stock_symbol

        # The type of organization
        sig do
          returns(
            T.nilable(
              SurgeAPI::AccountCreateParams::Organization::Type::OrSymbol
            )
          )
        end
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
            address:
              SurgeAPI::AccountCreateParams::Organization::Address::OrHash,
            contact:
              T.nilable(
                SurgeAPI::AccountCreateParams::Organization::Contact::OrHash
              ),
            country: T.nilable(String),
            email: T.nilable(String),
            identifier: T.nilable(String),
            identifier_type:
              T.nilable(
                SurgeAPI::AccountCreateParams::Organization::IdentifierType::OrSymbol
              ),
            industry:
              T.nilable(
                SurgeAPI::AccountCreateParams::Organization::Industry::OrSymbol
              ),
            mobile_number: T.nilable(String),
            regions_of_operation:
              T.nilable(
                T::Array[
                  SurgeAPI::AccountCreateParams::Organization::RegionsOfOperation::OrSymbol
                ]
              ),
            registered_name: T.nilable(String),
            stock_exchange:
              T.nilable(
                SurgeAPI::AccountCreateParams::Organization::StockExchange::OrSymbol
              ),
            stock_symbol: T.nilable(String),
            type:
              T.nilable(
                SurgeAPI::AccountCreateParams::Organization::Type::OrSymbol
              ),
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
              address: SurgeAPI::AccountCreateParams::Organization::Address,
              contact:
                T.nilable(SurgeAPI::AccountCreateParams::Organization::Contact),
              country: T.nilable(String),
              email: T.nilable(String),
              identifier: T.nilable(String),
              identifier_type:
                T.nilable(
                  SurgeAPI::AccountCreateParams::Organization::IdentifierType::OrSymbol
                ),
              industry:
                T.nilable(
                  SurgeAPI::AccountCreateParams::Organization::Industry::OrSymbol
                ),
              mobile_number: T.nilable(String),
              regions_of_operation:
                T.nilable(
                  T::Array[
                    SurgeAPI::AccountCreateParams::Organization::RegionsOfOperation::OrSymbol
                  ]
                ),
              registered_name: T.nilable(String),
              stock_exchange:
                T.nilable(
                  SurgeAPI::AccountCreateParams::Organization::StockExchange::OrSymbol
                ),
              stock_symbol: T.nilable(String),
              type:
                T.nilable(
                  SurgeAPI::AccountCreateParams::Organization::Type::OrSymbol
                ),
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
                SurgeAPI::AccountCreateParams::Organization::Address,
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
                SurgeAPI::AccountCreateParams::Organization::Contact,
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
              T.nilable(
                SurgeAPI::AccountCreateParams::Organization::Contact::Title::OrSymbol
              )
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
                T.nilable(
                  SurgeAPI::AccountCreateParams::Organization::Contact::Title::OrSymbol
                ),
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
                    SurgeAPI::AccountCreateParams::Organization::Contact::Title::OrSymbol
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
                T.all(
                  Symbol,
                  SurgeAPI::AccountCreateParams::Organization::Contact::Title
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CEO =
              T.let(
                :ceo,
                SurgeAPI::AccountCreateParams::Organization::Contact::Title::TaggedSymbol
              )
            CFO =
              T.let(
                :cfo,
                SurgeAPI::AccountCreateParams::Organization::Contact::Title::TaggedSymbol
              )
            DIRECTOR =
              T.let(
                :director,
                SurgeAPI::AccountCreateParams::Organization::Contact::Title::TaggedSymbol
              )
            GM =
              T.let(
                :gm,
                SurgeAPI::AccountCreateParams::Organization::Contact::Title::TaggedSymbol
              )
            VP =
              T.let(
                :vp,
                SurgeAPI::AccountCreateParams::Organization::Contact::Title::TaggedSymbol
              )
            GENERAL_COUNSEL =
              T.let(
                :general_counsel,
                SurgeAPI::AccountCreateParams::Organization::Contact::Title::TaggedSymbol
              )
            OTHER =
              T.let(
                :other,
                SurgeAPI::AccountCreateParams::Organization::Contact::Title::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::AccountCreateParams::Organization::Contact::Title::TaggedSymbol
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
              T.all(
                Symbol,
                SurgeAPI::AccountCreateParams::Organization::IdentifierType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EIN =
            T.let(
              :ein,
              SurgeAPI::AccountCreateParams::Organization::IdentifierType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::AccountCreateParams::Organization::IdentifierType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The industry in which the organization operates.
        module Industry
          extend SurgeAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                SurgeAPI::AccountCreateParams::Organization::Industry
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGRICULTURE =
            T.let(
              :agriculture,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          AUTOMOTIVE =
            T.let(
              :automotive,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          BANKING =
            T.let(
              :banking,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          CONSTRUCTION =
            T.let(
              :construction,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          CONSUMER =
            T.let(
              :consumer,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          EDUCATION =
            T.let(
              :education,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          ELECTRONICS =
            T.let(
              :electronics,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          ENERGY =
            T.let(
              :energy,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          ENGINEERING =
            T.let(
              :engineering,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          FAST_MOVING_CONSUMER_GOODS =
            T.let(
              :fast_moving_consumer_goods,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          FINANCIAL =
            T.let(
              :financial,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          FINTECH =
            T.let(
              :fintech,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          FOOD_AND_BEVERAGE =
            T.let(
              :food_and_beverage,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          GOVERNMENT =
            T.let(
              :government,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          HEALTHCARE =
            T.let(
              :healthcare,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          HOSPITALITY =
            T.let(
              :hospitality,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          INSURANCE =
            T.let(
              :insurance,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          JEWELRY =
            T.let(
              :jewelry,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          LEGAL =
            T.let(
              :legal,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          MANUFACTURING =
            T.let(
              :manufacturing,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          MEDIA =
            T.let(
              :media,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          NOT_FOR_PROFIT =
            T.let(
              :not_for_profit,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          OIL_AND_GAS =
            T.let(
              :oil_and_gas,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          ONLINE =
            T.let(
              :online,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          PROFESSIONAL_SERVICES =
            T.let(
              :professional_services,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          RAW_MATERIALS =
            T.let(
              :raw_materials,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          REAL_ESTATE =
            T.let(
              :real_estate,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          RELIGION =
            T.let(
              :religion,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          RETAIL =
            T.let(
              :retail,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          TECHNOLOGY =
            T.let(
              :technology,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          TELECOMMUNICATIONS =
            T.let(
              :telecommunications,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          TRANSPORTATION =
            T.let(
              :transportation,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )
          TRAVEL =
            T.let(
              :travel,
              SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::AccountCreateParams::Organization::Industry::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module RegionsOfOperation
          extend SurgeAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                SurgeAPI::AccountCreateParams::Organization::RegionsOfOperation
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AFRICA =
            T.let(
              :africa,
              SurgeAPI::AccountCreateParams::Organization::RegionsOfOperation::TaggedSymbol
            )
          ASIA =
            T.let(
              :asia,
              SurgeAPI::AccountCreateParams::Organization::RegionsOfOperation::TaggedSymbol
            )
          AUSTRALIA =
            T.let(
              :australia,
              SurgeAPI::AccountCreateParams::Organization::RegionsOfOperation::TaggedSymbol
            )
          EUROPE =
            T.let(
              :europe,
              SurgeAPI::AccountCreateParams::Organization::RegionsOfOperation::TaggedSymbol
            )
          LATIN_AMERICA =
            T.let(
              :latin_america,
              SurgeAPI::AccountCreateParams::Organization::RegionsOfOperation::TaggedSymbol
            )
          USA_AND_CANADA =
            T.let(
              :usa_and_canada,
              SurgeAPI::AccountCreateParams::Organization::RegionsOfOperation::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::AccountCreateParams::Organization::RegionsOfOperation::TaggedSymbol
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
              T.all(
                Symbol,
                SurgeAPI::AccountCreateParams::Organization::StockExchange
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AMEX =
            T.let(
              :amex,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          AMX =
            T.let(
              :amx,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          ASX =
            T.let(
              :asx,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          B3 =
            T.let(
              :b3,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          BME =
            T.let(
              :bme,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          BSE =
            T.let(
              :bse,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          FRA =
            T.let(
              :fra,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          ICEX =
            T.let(
              :icex,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          JPX =
            T.let(
              :jpx,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          JSE =
            T.let(
              :jse,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          KRX =
            T.let(
              :krx,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          LON =
            T.let(
              :lon,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          NASDAQ =
            T.let(
              :nasdaq,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          NONE =
            T.let(
              :none,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          NYSE =
            T.let(
              :nyse,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          NSE =
            T.let(
              :nse,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          OMX =
            T.let(
              :omx,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          OTHER =
            T.let(
              :other,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          SEHK =
            T.let(
              :sehk,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          SGX =
            T.let(
              :sgx,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          SSE =
            T.let(
              :sse,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          STO =
            T.let(
              :sto,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          SWX =
            T.let(
              :swx,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          SZSE =
            T.let(
              :szse,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          TSX =
            T.let(
              :tsx,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          TWSE =
            T.let(
              :twse,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )
          VSE =
            T.let(
              :vse,
              SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::AccountCreateParams::Organization::StockExchange::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The type of organization
        module Type
          extend SurgeAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, SurgeAPI::AccountCreateParams::Organization::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CO_OP =
            T.let(
              :co_op,
              SurgeAPI::AccountCreateParams::Organization::Type::TaggedSymbol
            )
          GOVERNMENT =
            T.let(
              :government,
              SurgeAPI::AccountCreateParams::Organization::Type::TaggedSymbol
            )
          LLC =
            T.let(
              :llc,
              SurgeAPI::AccountCreateParams::Organization::Type::TaggedSymbol
            )
          NON_PROFIT =
            T.let(
              :non_profit,
              SurgeAPI::AccountCreateParams::Organization::Type::TaggedSymbol
            )
          PARTNERSHIP =
            T.let(
              :partnership,
              SurgeAPI::AccountCreateParams::Organization::Type::TaggedSymbol
            )
          PRIVATE_CORPORATION =
            T.let(
              :private_corporation,
              SurgeAPI::AccountCreateParams::Organization::Type::TaggedSymbol
            )
          PUBLIC_CORPORATION =
            T.let(
              :public_corporation,
              SurgeAPI::AccountCreateParams::Organization::Type::TaggedSymbol
            )
          SOLE_PROPRIETOR =
            T.let(
              :sole_proprietor,
              SurgeAPI::AccountCreateParams::Organization::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::AccountCreateParams::Organization::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
