# frozen_string_literal: true

module Surge
  [Surge::Internal::Type::BaseModel, *Surge::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Surge::Internal::AnyHash) } }
  end

  Surge::Internal::Util.walk_namespaces(Surge::Models).each do |mod|
    case mod
    in Surge::Internal::Type::Enum | Surge::Internal::Type::Union
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

  Surge::Internal::Util.walk_namespaces(Surge::Models)
                       .lazy
                       .grep(Surge::Internal::Type::Union)
                       .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Account = Surge::Models::Account

  AccountCreateParams = Surge::Models::AccountCreateParams

  AccountParams = Surge::Models::AccountParams

  AccountRetrieveStatusParams = Surge::Models::AccountRetrieveStatusParams

  AccountStatus = Surge::Models::AccountStatus

  AccountUpdateParams = Surge::Models::AccountUpdateParams

  AttachmentParams = Surge::Models::AttachmentParams

  Blast = Surge::Models::Blast

  BlastCreateParams = Surge::Models::BlastCreateParams

  BlastParams = Surge::Models::BlastParams

  CallEndedWebhookEvent = Surge::Models::CallEndedWebhookEvent

  Campaign = Surge::Models::Campaign

  CampaignApprovedWebhookEvent = Surge::Models::CampaignApprovedWebhookEvent

  CampaignCreateParams = Surge::Models::CampaignCreateParams

  CampaignParams = Surge::Models::CampaignParams

  Contact = Surge::Models::Contact

  ContactCreateParams = Surge::Models::ContactCreateParams

  ContactParams = Surge::Models::ContactParams

  ContactRetrieveParams = Surge::Models::ContactRetrieveParams

  ContactUpdateParams = Surge::Models::ContactUpdateParams

  ConversationCreatedWebhookEvent = Surge::Models::ConversationCreatedWebhookEvent

  Error = Surge::Models::Error

  Message = Surge::Models::Message

  MessageCreateParams = Surge::Models::MessageCreateParams

  MessageDeliveredWebhookEvent = Surge::Models::MessageDeliveredWebhookEvent

  MessageFailedWebhookEvent = Surge::Models::MessageFailedWebhookEvent

  MessageParams = Surge::Models::MessageParams

  MessageReceivedWebhookEvent = Surge::Models::MessageReceivedWebhookEvent

  MessageSentWebhookEvent = Surge::Models::MessageSentWebhookEvent

  Organization = Surge::Models::Organization

  OrganizationParams = Surge::Models::OrganizationParams

  PhoneNumber = Surge::Models::PhoneNumber

  PhoneNumberPurchaseParams = Surge::Models::PhoneNumberPurchaseParams

  UnwrapWebhookEvent = Surge::Models::UnwrapWebhookEvent

  User = Surge::Models::User

  UserCreateParams = Surge::Models::UserCreateParams

  UserCreateTokenParams = Surge::Models::UserCreateTokenParams

  UserParams = Surge::Models::UserParams

  UserRetrieveParams = Surge::Models::UserRetrieveParams

  UserTokenParams = Surge::Models::UserTokenParams

  UserTokenResponse = Surge::Models::UserTokenResponse

  UserUpdateParams = Surge::Models::UserUpdateParams

  Verification = Surge::Models::Verification

  VerificationCheck = Surge::Models::VerificationCheck

  VerificationCheckParams = Surge::Models::VerificationCheckParams

  VerificationCreateParams = Surge::Models::VerificationCreateParams

  VerificationParams = Surge::Models::VerificationParams

  WebhookUnwrapParams = Surge::Models::WebhookUnwrapParams
end
