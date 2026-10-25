# typed: strong

module SurgeAPI
  module Models
    class TollFreeCampaignUpdateParams < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::TollFreeCampaignUpdateParams,
            SurgeAPI::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.nilable(
            T::Array[
              T.any(
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember0,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember2,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember3
              )
            ]
          )
        )
      end
      attr_reader :consent_flows

      sig do
        params(
          consent_flows:
            T::Array[
              T.any(
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember0::OrHash,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::OrHash,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember2::OrHash,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember3::OrHash
              )
            ]
        ).void
      end
      attr_writer :consent_flows

      # An explanation of how the toll-free number will be used.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig do
        returns(
          T.nilable(
            T::Array[SurgeAPI::TollFreeCampaignUpdateParams::Include::OrSymbol]
          )
        )
      end
      attr_reader :includes

      sig do
        params(
          includes:
            T::Array[SurgeAPI::TollFreeCampaignUpdateParams::Include::OrSymbol]
        ).void
      end
      attr_writer :includes

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :message_samples

      sig { params(message_samples: T::Array[String]).void }
      attr_writer :message_samples

      sig { returns(T.nilable(String)) }
      attr_reader :privacy_policy_url

      sig { params(privacy_policy_url: String).void }
      attr_writer :privacy_policy_url

      sig { returns(T.nilable(String)) }
      attr_reader :terms_and_conditions_url

      sig { params(terms_and_conditions_url: String).void }
      attr_writer :terms_and_conditions_url

      sig do
        returns(
          T.nilable(
            T::Array[SurgeAPI::TollFreeCampaignUpdateParams::UseCase::OrSymbol]
          )
        )
      end
      attr_reader :use_cases

      sig do
        params(
          use_cases:
            T::Array[SurgeAPI::TollFreeCampaignUpdateParams::UseCase::OrSymbol]
        ).void
      end
      attr_writer :use_cases

      # Parameters for updating a toll-free campaign.
      sig do
        params(
          consent_flows:
            T::Array[
              T.any(
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember0::OrHash,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::OrHash,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember2::OrHash,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember3::OrHash
              )
            ],
          description: String,
          includes:
            T::Array[SurgeAPI::TollFreeCampaignUpdateParams::Include::OrSymbol],
          message_samples: T::Array[String],
          privacy_policy_url: String,
          terms_and_conditions_url: String,
          use_cases:
            T::Array[SurgeAPI::TollFreeCampaignUpdateParams::UseCase::OrSymbol]
        ).returns(T.attached_class)
      end
      def self.new(
        consent_flows: nil,
        # An explanation of how the toll-free number will be used.
        description: nil,
        includes: nil,
        message_samples: nil,
        privacy_policy_url: nil,
        terms_and_conditions_url: nil,
        use_cases: nil
      )
      end

      sig do
        override.returns(
          {
            consent_flows:
              T::Array[
                T.any(
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember0,
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1,
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember2,
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember3
                )
              ],
            description: String,
            includes:
              T::Array[
                SurgeAPI::TollFreeCampaignUpdateParams::Include::OrSymbol
              ],
            message_samples: T::Array[String],
            privacy_policy_url: String,
            terms_and_conditions_url: String,
            use_cases:
              T::Array[
                SurgeAPI::TollFreeCampaignUpdateParams::UseCase::OrSymbol
              ]
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
              SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember0,
              SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1,
              SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember2,
              SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember3
            )
          end

        class UnionMember0 < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember0,
                SurgeAPI::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :script

          sig do
            returns(
              SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember0::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              script: String,
              type:
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember0::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(script:, type:)
          end

          sig do
            override.returns(
              {
                script: String,
                type:
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember0::Type::OrSymbol
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
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember0::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VERBAL =
              T.let(
                :verbal,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember0::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember0::Type::TaggedSymbol
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
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1,
                SurgeAPI::Internal::AnyHash
              )
            end

          sig do
            returns(
              SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Owner::OrSymbol
            )
          end
          attr_accessor :owner

          sig do
            returns(
              SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Type::OrSymbol
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
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Screenshot
              )
            )
          end
          attr_reader :screenshot

          sig do
            params(
              screenshot:
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Screenshot::OrHash
            ).void
          end
          attr_writer :screenshot

          sig do
            params(
              owner:
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Owner::OrSymbol,
              type:
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Type::OrSymbol,
              form_url: String,
              screenshot:
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Screenshot::OrHash
            ).returns(T.attached_class)
          end
          def self.new(owner:, type:, form_url: nil, screenshot: nil)
          end

          sig do
            override.returns(
              {
                owner:
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Owner::OrSymbol,
                type:
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Type::OrSymbol,
                form_url: String,
                screenshot:
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Screenshot
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
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Owner
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            BRAND =
              T.let(
                :brand,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Owner::TaggedSymbol
              )
            PLATFORM =
              T.let(
                :platform,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Owner::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Owner::TaggedSymbol
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
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            WEB_FORM =
              T.let(
                :web_form,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Type::TaggedSymbol
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
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Screenshot,
                  SurgeAPI::Internal::AnyHash
                )
              end

            sig do
              returns(
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Screenshot::Reason::OrSymbol
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
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Screenshot::Reason::OrSymbol,
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
                    SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Screenshot::Reason::OrSymbol,
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
                    SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Screenshot::Reason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              BEHIND_LOGIN =
                T.let(
                  :behind_login,
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Screenshot::Reason::TaggedSymbol
                )
              UNDER_CONSTRUCTION =
                T.let(
                  :under_construction,
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Screenshot::Reason::TaggedSymbol
                )
              OTHER =
                T.let(
                  :other,
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Screenshot::Reason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1::Screenshot::Reason::TaggedSymbol
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
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember2,
                SurgeAPI::Internal::AnyHash
              )
            end

          sig { returns(T::Array[String]) }
          attr_accessor :file_urls

          sig do
            returns(
              SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember2::Type::OrSymbol
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
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember2::Type::OrSymbol,
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
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember2::Type::OrSymbol,
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
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember2::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TEXT =
              T.let(
                :text,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember2::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember2::Type::TaggedSymbol
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
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember3,
                SurgeAPI::Internal::AnyHash
              )
            end

          sig { returns(T::Array[String]) }
          attr_accessor :file_urls

          sig do
            returns(
              SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember3::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              file_urls: T::Array[String],
              type:
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember3::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(file_urls:, type:)
          end

          sig do
            override.returns(
              {
                file_urls: T::Array[String],
                type:
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember3::Type::OrSymbol
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
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember3::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PAPER_FORM =
              T.let(
                :paper_form,
                SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember3::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember3::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[
              SurgeAPI::TollFreeCampaignUpdateParams::ConsentFlow::Variants
            ]
          )
        end
        def self.variants
        end
      end

      module Include
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, SurgeAPI::TollFreeCampaignUpdateParams::Include)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AGE_GATED =
          T.let(
            :age_gated,
            SurgeAPI::TollFreeCampaignUpdateParams::Include::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              SurgeAPI::TollFreeCampaignUpdateParams::Include::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      module UseCase
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, SurgeAPI::TollFreeCampaignUpdateParams::UseCase)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWO_FACTOR_AUTHENTICATION =
          T.let(
            :two_factor_authentication,
            SurgeAPI::TollFreeCampaignUpdateParams::UseCase::TaggedSymbol
          )
        ACCOUNT_NOTIFICATION =
          T.let(
            :account_notification,
            SurgeAPI::TollFreeCampaignUpdateParams::UseCase::TaggedSymbol
          )
        CUSTOMER_CARE =
          T.let(
            :customer_care,
            SurgeAPI::TollFreeCampaignUpdateParams::UseCase::TaggedSymbol
          )
        CHARITY =
          T.let(
            :charity,
            SurgeAPI::TollFreeCampaignUpdateParams::UseCase::TaggedSymbol
          )
        DELIVERY_NOTIFICATION =
          T.let(
            :delivery_notification,
            SurgeAPI::TollFreeCampaignUpdateParams::UseCase::TaggedSymbol
          )
        FRAUD_ALERT =
          T.let(
            :fraud_alert,
            SurgeAPI::TollFreeCampaignUpdateParams::UseCase::TaggedSymbol
          )
        EVENT =
          T.let(
            :event,
            SurgeAPI::TollFreeCampaignUpdateParams::UseCase::TaggedSymbol
          )
        HIGHER_EDUCATION =
          T.let(
            :higher_education,
            SurgeAPI::TollFreeCampaignUpdateParams::UseCase::TaggedSymbol
          )
        K12_EDUCATION =
          T.let(
            :k12_education,
            SurgeAPI::TollFreeCampaignUpdateParams::UseCase::TaggedSymbol
          )
        MARKETING =
          T.let(
            :marketing,
            SurgeAPI::TollFreeCampaignUpdateParams::UseCase::TaggedSymbol
          )
        POLLING_VOTING =
          T.let(
            :polling_voting,
            SurgeAPI::TollFreeCampaignUpdateParams::UseCase::TaggedSymbol
          )
        POLITICAL =
          T.let(
            :political,
            SurgeAPI::TollFreeCampaignUpdateParams::UseCase::TaggedSymbol
          )
        PUBLIC_SERVICE_ANNOUNCEMENT =
          T.let(
            :public_service_announcement,
            SurgeAPI::TollFreeCampaignUpdateParams::UseCase::TaggedSymbol
          )
        SECURITY_ALERT =
          T.let(
            :security_alert,
            SurgeAPI::TollFreeCampaignUpdateParams::UseCase::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              SurgeAPI::TollFreeCampaignUpdateParams::UseCase::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
