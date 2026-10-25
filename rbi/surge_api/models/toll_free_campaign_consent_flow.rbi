# typed: strong

module SurgeAPI
  module Models
    # A consent flow returned on toll-free campaign responses.
    module TollFreeCampaignConsentFlow
      extend SurgeAPI::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            SurgeAPI::TollFreeCampaignConsentFlow::UnionMember0,
            SurgeAPI::TollFreeCampaignConsentFlow::UnionMember1,
            SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2,
            SurgeAPI::TollFreeCampaignConsentFlow::UnionMember3,
            SurgeAPI::TollFreeCampaignConsentFlow::Type
          )
        end

      class UnionMember0 < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::TollFreeCampaignConsentFlow::UnionMember0,
              SurgeAPI::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :script

        sig do
          returns(
            SurgeAPI::TollFreeCampaignConsentFlow::UnionMember0::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            script: String,
            type:
              SurgeAPI::TollFreeCampaignConsentFlow::UnionMember0::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(script:, type:)
        end

        sig do
          override.returns(
            {
              script: String,
              type:
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember0::Type::TaggedSymbol
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
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember0::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          VERBAL =
            T.let(
              :verbal,
              SurgeAPI::TollFreeCampaignConsentFlow::UnionMember0::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember0::Type::TaggedSymbol
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
              SurgeAPI::TollFreeCampaignConsentFlow::UnionMember1,
              SurgeAPI::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :form_url

        sig do
          returns(
            SurgeAPI::TollFreeCampaignConsentFlow::UnionMember1::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            form_url: String,
            type:
              SurgeAPI::TollFreeCampaignConsentFlow::UnionMember1::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(form_url:, type:)
        end

        sig do
          override.returns(
            {
              form_url: String,
              type:
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember1::Type::TaggedSymbol
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
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember1::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WEB_FORM =
            T.let(
              :web_form,
              SurgeAPI::TollFreeCampaignConsentFlow::UnionMember1::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember1::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class UnionMember2 < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2,
              SurgeAPI::Internal::AnyHash
            )
          end

        sig do
          returns(
            SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Screenshot
          )
        end
        attr_reader :screenshot

        sig do
          params(
            screenshot:
              SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Screenshot::OrHash
          ).void
        end
        attr_writer :screenshot

        sig do
          returns(
            SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            screenshot:
              SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Screenshot::OrHash,
            type:
              SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(screenshot:, type:)
        end

        sig do
          override.returns(
            {
              screenshot:
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Screenshot,
              type:
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        class Screenshot < SurgeAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Screenshot,
                SurgeAPI::Internal::AnyHash
              )
            end

          sig do
            returns(
              SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Screenshot::Reason::TaggedSymbol
            )
          end
          attr_accessor :reason

          sig { returns(T.nilable(String)) }
          attr_reader :reason_other

          sig { params(reason_other: String).void }
          attr_writer :reason_other

          sig do
            params(
              reason:
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Screenshot::Reason::OrSymbol,
              reason_other: String
            ).returns(T.attached_class)
          end
          def self.new(reason:, reason_other: nil)
          end

          sig do
            override.returns(
              {
                reason:
                  SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Screenshot::Reason::TaggedSymbol,
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
                  SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Screenshot::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            BEHIND_LOGIN =
              T.let(
                :behind_login,
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Screenshot::Reason::TaggedSymbol
              )
            UNDER_CONSTRUCTION =
              T.let(
                :under_construction,
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Screenshot::Reason::TaggedSymbol
              )
            OTHER =
              T.let(
                :other,
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Screenshot::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Screenshot::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        module Type
          extend SurgeAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WEB_FORM =
            T.let(
              :web_form,
              SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Type::TaggedSymbol
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
              SurgeAPI::TollFreeCampaignConsentFlow::UnionMember3,
              SurgeAPI::Internal::AnyHash
            )
          end

        sig do
          returns(
            SurgeAPI::TollFreeCampaignConsentFlow::UnionMember3::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :keywords

        sig { params(keywords: T::Array[String]).void }
        attr_writer :keywords

        sig do
          params(
            type:
              SurgeAPI::TollFreeCampaignConsentFlow::UnionMember3::Type::OrSymbol,
            keywords: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(type:, keywords: nil)
        end

        sig do
          override.returns(
            {
              type:
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember3::Type::TaggedSymbol,
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
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember3::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TEXT =
            T.let(
              :text,
              SurgeAPI::TollFreeCampaignConsentFlow::UnionMember3::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember3::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Type < SurgeAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SurgeAPI::TollFreeCampaignConsentFlow::Type,
              SurgeAPI::Internal::AnyHash
            )
          end

        sig do
          returns(
            SurgeAPI::TollFreeCampaignConsentFlow::Type::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            type: SurgeAPI::TollFreeCampaignConsentFlow::Type::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                SurgeAPI::TollFreeCampaignConsentFlow::Type::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend SurgeAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, SurgeAPI::TollFreeCampaignConsentFlow::Type::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PAPER_FORM =
            T.let(
              :paper_form,
              SurgeAPI::TollFreeCampaignConsentFlow::Type::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                SurgeAPI::TollFreeCampaignConsentFlow::Type::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      sig do
        override.returns(
          T::Array[SurgeAPI::TollFreeCampaignConsentFlow::Variants]
        )
      end
      def self.variants
      end
    end
  end
end
