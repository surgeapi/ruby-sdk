# typed: strong

module SurgeAPI
  module Models
    class TollFreeCampaignParams < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SurgeAPI::TollFreeCampaignParams, SurgeAPI::Internal::AnyHash)
        end

      sig do
        returns(
          T::Array[
            T.any(
              SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember0,
              SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1,
              SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember2,
              SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember3
            )
          ]
        )
      end
      attr_accessor :consent_flows

      # An explanation of how the toll-free number will be used.
      sig { returns(String) }
      attr_accessor :description

      sig { returns(T::Array[String]) }
      attr_accessor :message_samples

      # The toll-free phone number to register.
      sig { returns(String) }
      attr_accessor :phone_number_id

      sig { returns(String) }
      attr_accessor :privacy_policy_url

      sig { returns(String) }
      attr_accessor :terms_and_conditions_url

      sig do
        returns(T::Array[SurgeAPI::TollFreeCampaignParams::UseCase::OrSymbol])
      end
      attr_accessor :use_cases

      sig do
        returns(
          T.nilable(
            T::Array[SurgeAPI::TollFreeCampaignParams::Include::OrSymbol]
          )
        )
      end
      attr_reader :includes

      sig do
        params(
          includes:
            T::Array[SurgeAPI::TollFreeCampaignParams::Include::OrSymbol]
        ).void
      end
      attr_writer :includes

      # Parameters for creating a toll-free campaign through Surge
      sig do
        params(
          consent_flows:
            T::Array[
              T.any(
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember0::OrHash,
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::OrHash,
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember2::OrHash,
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember3::OrHash
              )
            ],
          description: String,
          message_samples: T::Array[String],
          phone_number_id: String,
          privacy_policy_url: String,
          terms_and_conditions_url: String,
          use_cases:
            T::Array[SurgeAPI::TollFreeCampaignParams::UseCase::OrSymbol],
          includes:
            T::Array[SurgeAPI::TollFreeCampaignParams::Include::OrSymbol]
        ).returns(T.attached_class)
      end
      def self.new(
        consent_flows:,
        # An explanation of how the toll-free number will be used.
        description:,
        message_samples:,
        # The toll-free phone number to register.
        phone_number_id:,
        privacy_policy_url:,
        terms_and_conditions_url:,
        use_cases:,
        includes: nil
      )
      end

      sig do
        override.returns(
          {
            consent_flows:
              T::Array[
                T.any(
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember0,
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1,
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember2,
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember3
                )
              ],
            description: String,
            message_samples: T::Array[String],
            phone_number_id: String,
            privacy_policy_url: String,
            terms_and_conditions_url: String,
            use_cases:
              T::Array[SurgeAPI::TollFreeCampaignParams::UseCase::OrSymbol],
            includes:
              T::Array[SurgeAPI::TollFreeCampaignParams::Include::OrSymbol]
          }
        )
      end
      def to_hash
      end

      module ConsentFlow
        extend SurgeAPI::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember0,
              SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1,
              SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember2,
              SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember3
            )
          end

        class UnionMember0 < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember0,
                SurgeAPI::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :script

          sig do
            returns(
              SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember0::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              script: String,
              type:
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember0::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(script:, type:)
          end

          sig do
            override.returns(
              {
                script: String,
                type:
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember0::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend SurgeAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember0::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VERBAL =
              T.let(
                :verbal,
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember0::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember0::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class UnionMember1 < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1,
                SurgeAPI::Internal::AnyHash
              )
            end

          sig do
            returns(
              SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Owner::OrSymbol
            )
          end
          attr_accessor :owner

          sig do
            returns(
              SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig { returns(T.nilable(String)) }
          attr_reader :form_url

          sig { params(form_url: String).void }
          attr_writer :form_url

          sig do
            returns(
              T.nilable(
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot
              )
            )
          end
          attr_reader :screenshot

          sig do
            params(
              screenshot:
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot::OrHash
            ).void
          end
          attr_writer :screenshot

          sig do
            params(
              owner:
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Owner::OrSymbol,
              type:
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Type::OrSymbol,
              form_url: String,
              screenshot:
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot::OrHash
            ).returns(T.attached_class)
          end
          def self.new(owner:, type:, form_url: nil, screenshot: nil)
          end

          sig do
            override.returns(
              {
                owner:
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Owner::OrSymbol,
                type:
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Type::OrSymbol,
                form_url: String,
                screenshot:
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot
              }
            )
          end
          def to_hash
          end

          module Owner
            extend SurgeAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Owner
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            BRAND =
              T.let(
                :brand,
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Owner::TaggedSymbol
              )
            PLATFORM =
              T.let(
                :platform,
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Owner::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Owner::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module Type
            extend SurgeAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            WEB_FORM =
              T.let(
                :web_form,
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Screenshot < SurgeAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot,
                  SurgeAPI::Internal::AnyHash
                )
              end

            sig do
              returns(
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot::Reason::OrSymbol
              )
            end
            attr_accessor :reason

            sig { returns(T::Array[String]) }
            attr_accessor :urls

            sig { returns(T.nilable(String)) }
            attr_reader :reason_other

            sig { params(reason_other: String).void }
            attr_writer :reason_other

            sig do
              params(
                reason:
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot::Reason::OrSymbol,
                urls: T::Array[String],
                reason_other: String
              ).returns(T.attached_class)
            end
            def self.new(reason:, urls:, reason_other: nil)
            end

            sig do
              override.returns(
                {
                  reason:
                    SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot::Reason::OrSymbol,
                  urls: T::Array[String],
                  reason_other: String
                }
              )
            end
            def to_hash
            end

            module Reason
              extend SurgeAPI::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot::Reason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              BEHIND_LOGIN =
                T.let(
                  :behind_login,
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot::Reason::TaggedSymbol
                )
              UNDER_CONSTRUCTION =
                T.let(
                  :under_construction,
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot::Reason::TaggedSymbol
                )
              OTHER =
                T.let(
                  :other,
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot::Reason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot::Reason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class UnionMember2 < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember2,
                SurgeAPI::Internal::AnyHash
              )
            end

          sig { returns(T::Array[String]) }
          attr_accessor :file_urls

          sig do
            returns(
              SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember2::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :keywords

          sig { params(keywords: T::Array[String]).void }
          attr_writer :keywords

          sig do
            params(
              file_urls: T::Array[String],
              type:
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember2::Type::OrSymbol,
              keywords: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(file_urls:, type:, keywords: nil)
          end

          sig do
            override.returns(
              {
                file_urls: T::Array[String],
                type:
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember2::Type::OrSymbol,
                keywords: T::Array[String]
              }
            )
          end
          def to_hash
          end

          module Type
            extend SurgeAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember2::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TEXT =
              T.let(
                :text,
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember2::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember2::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class UnionMember3 < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember3,
                SurgeAPI::Internal::AnyHash
              )
            end

          sig { returns(T::Array[String]) }
          attr_accessor :file_urls

          sig do
            returns(
              SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember3::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              file_urls: T::Array[String],
              type:
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember3::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(file_urls:, type:)
          end

          sig do
            override.returns(
              {
                file_urls: T::Array[String],
                type:
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember3::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend SurgeAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember3::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PAPER_FORM =
              T.let(
                :paper_form,
                SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember3::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember3::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[SurgeAPI::TollFreeCampaignParams::ConsentFlow::Variants]
          )
        end
        def self.variants
        end
      end

      module UseCase
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, SurgeAPI::TollFreeCampaignParams::UseCase)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWO_FACTOR_AUTHENTICATION =
          T.let(
            :two_factor_authentication,
            SurgeAPI::TollFreeCampaignParams::UseCase::TaggedSymbol
          )
        ACCOUNT_NOTIFICATION =
          T.let(
            :account_notification,
            SurgeAPI::TollFreeCampaignParams::UseCase::TaggedSymbol
          )
        CUSTOMER_CARE =
          T.let(
            :customer_care,
            SurgeAPI::TollFreeCampaignParams::UseCase::TaggedSymbol
          )
        CHARITY =
          T.let(
            :charity,
            SurgeAPI::TollFreeCampaignParams::UseCase::TaggedSymbol
          )
        DELIVERY_NOTIFICATION =
          T.let(
            :delivery_notification,
            SurgeAPI::TollFreeCampaignParams::UseCase::TaggedSymbol
          )
        FRAUD_ALERT =
          T.let(
            :fraud_alert,
            SurgeAPI::TollFreeCampaignParams::UseCase::TaggedSymbol
          )
        EVENT =
          T.let(:event, SurgeAPI::TollFreeCampaignParams::UseCase::TaggedSymbol)
        HIGHER_EDUCATION =
          T.let(
            :higher_education,
            SurgeAPI::TollFreeCampaignParams::UseCase::TaggedSymbol
          )
        K12_EDUCATION =
          T.let(
            :k12_education,
            SurgeAPI::TollFreeCampaignParams::UseCase::TaggedSymbol
          )
        MARKETING =
          T.let(
            :marketing,
            SurgeAPI::TollFreeCampaignParams::UseCase::TaggedSymbol
          )
        POLLING_VOTING =
          T.let(
            :polling_voting,
            SurgeAPI::TollFreeCampaignParams::UseCase::TaggedSymbol
          )
        POLITICAL =
          T.let(
            :political,
            SurgeAPI::TollFreeCampaignParams::UseCase::TaggedSymbol
          )
        PUBLIC_SERVICE_ANNOUNCEMENT =
          T.let(
            :public_service_announcement,
            SurgeAPI::TollFreeCampaignParams::UseCase::TaggedSymbol
          )
        SECURITY_ALERT =
          T.let(
            :security_alert,
            SurgeAPI::TollFreeCampaignParams::UseCase::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[SurgeAPI::TollFreeCampaignParams::UseCase::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Include
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, SurgeAPI::TollFreeCampaignParams::Include)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AGE_GATED =
          T.let(
            :age_gated,
            SurgeAPI::TollFreeCampaignParams::Include::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[SurgeAPI::TollFreeCampaignParams::Include::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
