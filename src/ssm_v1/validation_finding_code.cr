private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ValidationFindingCode
    TargetInaccessible
    TargetUnusable
    TargetStateWarning
    AwsRoleAssumptionFailed
    WebIdentityTokenFailed
    OutboundWebIdentityFederationDisabled
    ProviderCredentialCreationFailed
    TenantSummary
    SubscriptionAccessible

    def self.to_json(e : ValidationFindingCode, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ValidationFindingCode
      value = pull.read_string
      case value
      when "TargetInaccessible"                    then AS::ValidationFindingCode::TargetInaccessible
      when "TargetUnusable"                        then AS::ValidationFindingCode::TargetUnusable
      when "TargetStateWarning"                    then AS::ValidationFindingCode::TargetStateWarning
      when "AwsRoleAssumptionFailed"               then AS::ValidationFindingCode::AwsRoleAssumptionFailed
      when "WebIdentityTokenFailed"                then AS::ValidationFindingCode::WebIdentityTokenFailed
      when "OutboundWebIdentityFederationDisabled" then AS::ValidationFindingCode::OutboundWebIdentityFederationDisabled
      when "ProviderCredentialCreationFailed"      then AS::ValidationFindingCode::ProviderCredentialCreationFailed
      when "TenantSummary"                         then AS::ValidationFindingCode::TenantSummary
      when "SubscriptionAccessible"                then AS::ValidationFindingCode::SubscriptionAccessible
      else
        raise Exception.new("unknown enum value for 'ValidationFindingCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::ValidationFindingCode?
      case key
      when "TargetInaccessible"                    then AS::ValidationFindingCode::TargetInaccessible
      when "TargetUnusable"                        then AS::ValidationFindingCode::TargetUnusable
      when "TargetStateWarning"                    then AS::ValidationFindingCode::TargetStateWarning
      when "AwsRoleAssumptionFailed"               then AS::ValidationFindingCode::AwsRoleAssumptionFailed
      when "WebIdentityTokenFailed"                then AS::ValidationFindingCode::WebIdentityTokenFailed
      when "OutboundWebIdentityFederationDisabled" then AS::ValidationFindingCode::OutboundWebIdentityFederationDisabled
      when "ProviderCredentialCreationFailed"      then AS::ValidationFindingCode::ProviderCredentialCreationFailed
      when "TenantSummary"                         then AS::ValidationFindingCode::TenantSummary
      when "SubscriptionAccessible"                then AS::ValidationFindingCode::SubscriptionAccessible
      else
        nil
      end
    end
  end
end
