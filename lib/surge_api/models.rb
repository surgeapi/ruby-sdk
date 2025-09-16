# frozen_string_literal: true

module SurgeAPI
  [SurgeAPI::Internal::Type::BaseModel, *SurgeAPI::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, SurgeAPI::Internal::AnyHash) } }
  end

  SurgeAPI::Internal::Util.walk_namespaces(SurgeAPI::Models).each do |mod|
    case mod
    in SurgeAPI::Internal::Type::Enum | SurgeAPI::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  SurgeAPI::Internal::Util.walk_namespaces(SurgeAPI::Models)
                          .lazy
                          .grep(SurgeAPI::Internal::Type::Union)
                          .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Account = SurgeAPI::Models::Account

  AccountCreateParams = SurgeAPI::Models::AccountCreateParams

  AccountParams = SurgeAPI::Models::AccountParams

  AccountRetrieveStatusParams = SurgeAPI::Models::AccountRetrieveStatusParams

  AccountStatus = SurgeAPI::Models::AccountStatus

  AccountUpdateParams = SurgeAPI::Models::AccountUpdateParams

  AttachmentParams = SurgeAPI::Models::AttachmentParams

  Blast = SurgeAPI::Models::Blast

  BlastCreateParams = SurgeAPI::Models::BlastCreateParams

  BlastParams = SurgeAPI::Models::BlastParams

  CallEndedWebhookEvent = SurgeAPI::Models::CallEndedWebhookEvent

  Campaign = SurgeAPI::Models::Campaign

  CampaignApprovedWebhookEvent = SurgeAPI::Models::CampaignApprovedWebhookEvent

  CampaignCreateParams = SurgeAPI::Models::CampaignCreateParams

  CampaignParams = SurgeAPI::Models::CampaignParams

  Contact = SurgeAPI::Models::Contact

  ContactCreateParams = SurgeAPI::Models::ContactCreateParams

  ContactParams = SurgeAPI::Models::ContactParams

  ContactRetrieveParams = SurgeAPI::Models::ContactRetrieveParams

  ContactUpdateParams = SurgeAPI::Models::ContactUpdateParams

  ConversationCreatedWebhookEvent = SurgeAPI::Models::ConversationCreatedWebhookEvent

  Error = SurgeAPI::Models::Error

  Message = SurgeAPI::Models::Message

  MessageCreateParams = SurgeAPI::Models::MessageCreateParams

  MessageDeliveredWebhookEvent = SurgeAPI::Models::MessageDeliveredWebhookEvent

  MessageFailedWebhookEvent = SurgeAPI::Models::MessageFailedWebhookEvent

  MessageParams = SurgeAPI::Models::MessageParams

  MessageReceivedWebhookEvent = SurgeAPI::Models::MessageReceivedWebhookEvent

  MessageSentWebhookEvent = SurgeAPI::Models::MessageSentWebhookEvent

  Organization = SurgeAPI::Models::Organization

  OrganizationParams = SurgeAPI::Models::OrganizationParams

  PhoneNumber = SurgeAPI::Models::PhoneNumber

  PhoneNumberPurchaseParams = SurgeAPI::Models::PhoneNumberPurchaseParams

  UnwrapWebhookEvent = SurgeAPI::Models::UnwrapWebhookEvent

  User = SurgeAPI::Models::User

  UserCreateParams = SurgeAPI::Models::UserCreateParams

  UserCreateTokenParams = SurgeAPI::Models::UserCreateTokenParams

  UserParams = SurgeAPI::Models::UserParams

  UserRetrieveParams = SurgeAPI::Models::UserRetrieveParams

  UserTokenParams = SurgeAPI::Models::UserTokenParams

  UserTokenResponse = SurgeAPI::Models::UserTokenResponse

  UserUpdateParams = SurgeAPI::Models::UserUpdateParams

  Verification = SurgeAPI::Models::Verification

  VerificationCheck = SurgeAPI::Models::VerificationCheck

  VerificationCheckParams = SurgeAPI::Models::VerificationCheckParams

  VerificationCreateParams = SurgeAPI::Models::VerificationCreateParams

  VerificationParams = SurgeAPI::Models::VerificationParams

  WebhookUnwrapParams = SurgeAPI::Models::WebhookUnwrapParams
end
