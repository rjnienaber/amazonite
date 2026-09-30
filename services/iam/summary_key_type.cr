private alias AI = Amazonite::Iam

module Amazonite::Iam
  enum SummaryKeyType
    Users
    UsersQuota
    Groups
    GroupsQuota
    ServerCertificates
    ServerCertificatesQuota
    UserPolicySizeQuota
    GroupPolicySizeQuota
    GroupsPerUserQuota
    SigningCertificatesPerUserQuota
    AccessKeysPerUserQuota
    MfaDevices
    MfaDevicesInUse
    AccountMfaEnabled
    AccountAccessKeysPresent
    AccountPasswordPresent
    AccountSigningCertificatesPresent
    AttachedPoliciesPerGroupQuota
    AttachedPoliciesPerRoleQuota
    AttachedPoliciesPerUserQuota
    Policies
    PoliciesQuota
    PolicySizeQuota
    PolicyVersionsInUse
    PolicyVersionsInUseQuota
    VersionsPerPolicyQuota
    GlobalEndpointTokenVersion
    AssumeRolePolicySizeQuota
    InstanceProfiles
    InstanceProfilesQuota
    Providers
    RolePolicySizeQuota
    Roles
    RolesQuota

    def self.to_json(e : SummaryKeyType, json : JSON::Builder) : Nil
      value = case e
              when AI::SummaryKeyType::Users                             then "Users"
              when AI::SummaryKeyType::UsersQuota                        then "UsersQuota"
              when AI::SummaryKeyType::Groups                            then "Groups"
              when AI::SummaryKeyType::GroupsQuota                       then "GroupsQuota"
              when AI::SummaryKeyType::ServerCertificates                then "ServerCertificates"
              when AI::SummaryKeyType::ServerCertificatesQuota           then "ServerCertificatesQuota"
              when AI::SummaryKeyType::UserPolicySizeQuota               then "UserPolicySizeQuota"
              when AI::SummaryKeyType::GroupPolicySizeQuota              then "GroupPolicySizeQuota"
              when AI::SummaryKeyType::GroupsPerUserQuota                then "GroupsPerUserQuota"
              when AI::SummaryKeyType::SigningCertificatesPerUserQuota   then "SigningCertificatesPerUserQuota"
              when AI::SummaryKeyType::AccessKeysPerUserQuota            then "AccessKeysPerUserQuota"
              when AI::SummaryKeyType::MfaDevices                        then "MFADevices"
              when AI::SummaryKeyType::MfaDevicesInUse                   then "MFADevicesInUse"
              when AI::SummaryKeyType::AccountMfaEnabled                 then "AccountMFAEnabled"
              when AI::SummaryKeyType::AccountAccessKeysPresent          then "AccountAccessKeysPresent"
              when AI::SummaryKeyType::AccountPasswordPresent            then "AccountPasswordPresent"
              when AI::SummaryKeyType::AccountSigningCertificatesPresent then "AccountSigningCertificatesPresent"
              when AI::SummaryKeyType::AttachedPoliciesPerGroupQuota     then "AttachedPoliciesPerGroupQuota"
              when AI::SummaryKeyType::AttachedPoliciesPerRoleQuota      then "AttachedPoliciesPerRoleQuota"
              when AI::SummaryKeyType::AttachedPoliciesPerUserQuota      then "AttachedPoliciesPerUserQuota"
              when AI::SummaryKeyType::Policies                          then "Policies"
              when AI::SummaryKeyType::PoliciesQuota                     then "PoliciesQuota"
              when AI::SummaryKeyType::PolicySizeQuota                   then "PolicySizeQuota"
              when AI::SummaryKeyType::PolicyVersionsInUse               then "PolicyVersionsInUse"
              when AI::SummaryKeyType::PolicyVersionsInUseQuota          then "PolicyVersionsInUseQuota"
              when AI::SummaryKeyType::VersionsPerPolicyQuota            then "VersionsPerPolicyQuota"
              when AI::SummaryKeyType::GlobalEndpointTokenVersion        then "GlobalEndpointTokenVersion"
              when AI::SummaryKeyType::AssumeRolePolicySizeQuota         then "AssumeRolePolicySizeQuota"
              when AI::SummaryKeyType::InstanceProfiles                  then "InstanceProfiles"
              when AI::SummaryKeyType::InstanceProfilesQuota             then "InstanceProfilesQuota"
              when AI::SummaryKeyType::Providers                         then "Providers"
              when AI::SummaryKeyType::RolePolicySizeQuota               then "RolePolicySizeQuota"
              when AI::SummaryKeyType::Roles                             then "Roles"
              when AI::SummaryKeyType::RolesQuota                        then "RolesQuota"
              else
                raise Exception.new("unknown enum value for 'SummaryKeyType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::SummaryKeyType
      value = pull.read_string
      case value
      when "Users"                             then AI::SummaryKeyType::Users
      when "UsersQuota"                        then AI::SummaryKeyType::UsersQuota
      when "Groups"                            then AI::SummaryKeyType::Groups
      when "GroupsQuota"                       then AI::SummaryKeyType::GroupsQuota
      when "ServerCertificates"                then AI::SummaryKeyType::ServerCertificates
      when "ServerCertificatesQuota"           then AI::SummaryKeyType::ServerCertificatesQuota
      when "UserPolicySizeQuota"               then AI::SummaryKeyType::UserPolicySizeQuota
      when "GroupPolicySizeQuota"              then AI::SummaryKeyType::GroupPolicySizeQuota
      when "GroupsPerUserQuota"                then AI::SummaryKeyType::GroupsPerUserQuota
      when "SigningCertificatesPerUserQuota"   then AI::SummaryKeyType::SigningCertificatesPerUserQuota
      when "AccessKeysPerUserQuota"            then AI::SummaryKeyType::AccessKeysPerUserQuota
      when "MFADevices"                        then AI::SummaryKeyType::MfaDevices
      when "MFADevicesInUse"                   then AI::SummaryKeyType::MfaDevicesInUse
      when "AccountMFAEnabled"                 then AI::SummaryKeyType::AccountMfaEnabled
      when "AccountAccessKeysPresent"          then AI::SummaryKeyType::AccountAccessKeysPresent
      when "AccountPasswordPresent"            then AI::SummaryKeyType::AccountPasswordPresent
      when "AccountSigningCertificatesPresent" then AI::SummaryKeyType::AccountSigningCertificatesPresent
      when "AttachedPoliciesPerGroupQuota"     then AI::SummaryKeyType::AttachedPoliciesPerGroupQuota
      when "AttachedPoliciesPerRoleQuota"      then AI::SummaryKeyType::AttachedPoliciesPerRoleQuota
      when "AttachedPoliciesPerUserQuota"      then AI::SummaryKeyType::AttachedPoliciesPerUserQuota
      when "Policies"                          then AI::SummaryKeyType::Policies
      when "PoliciesQuota"                     then AI::SummaryKeyType::PoliciesQuota
      when "PolicySizeQuota"                   then AI::SummaryKeyType::PolicySizeQuota
      when "PolicyVersionsInUse"               then AI::SummaryKeyType::PolicyVersionsInUse
      when "PolicyVersionsInUseQuota"          then AI::SummaryKeyType::PolicyVersionsInUseQuota
      when "VersionsPerPolicyQuota"            then AI::SummaryKeyType::VersionsPerPolicyQuota
      when "GlobalEndpointTokenVersion"        then AI::SummaryKeyType::GlobalEndpointTokenVersion
      when "AssumeRolePolicySizeQuota"         then AI::SummaryKeyType::AssumeRolePolicySizeQuota
      when "InstanceProfiles"                  then AI::SummaryKeyType::InstanceProfiles
      when "InstanceProfilesQuota"             then AI::SummaryKeyType::InstanceProfilesQuota
      when "Providers"                         then AI::SummaryKeyType::Providers
      when "RolePolicySizeQuota"               then AI::SummaryKeyType::RolePolicySizeQuota
      when "Roles"                             then AI::SummaryKeyType::Roles
      when "RolesQuota"                        then AI::SummaryKeyType::RolesQuota
      else
        raise Exception.new("unknown enum value for 'SummaryKeyType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::SummaryKeyType::Users                             then "Users"
      when AI::SummaryKeyType::UsersQuota                        then "UsersQuota"
      when AI::SummaryKeyType::Groups                            then "Groups"
      when AI::SummaryKeyType::GroupsQuota                       then "GroupsQuota"
      when AI::SummaryKeyType::ServerCertificates                then "ServerCertificates"
      when AI::SummaryKeyType::ServerCertificatesQuota           then "ServerCertificatesQuota"
      when AI::SummaryKeyType::UserPolicySizeQuota               then "UserPolicySizeQuota"
      when AI::SummaryKeyType::GroupPolicySizeQuota              then "GroupPolicySizeQuota"
      when AI::SummaryKeyType::GroupsPerUserQuota                then "GroupsPerUserQuota"
      when AI::SummaryKeyType::SigningCertificatesPerUserQuota   then "SigningCertificatesPerUserQuota"
      when AI::SummaryKeyType::AccessKeysPerUserQuota            then "AccessKeysPerUserQuota"
      when AI::SummaryKeyType::MfaDevices                        then "MFADevices"
      when AI::SummaryKeyType::MfaDevicesInUse                   then "MFADevicesInUse"
      when AI::SummaryKeyType::AccountMfaEnabled                 then "AccountMFAEnabled"
      when AI::SummaryKeyType::AccountAccessKeysPresent          then "AccountAccessKeysPresent"
      when AI::SummaryKeyType::AccountPasswordPresent            then "AccountPasswordPresent"
      when AI::SummaryKeyType::AccountSigningCertificatesPresent then "AccountSigningCertificatesPresent"
      when AI::SummaryKeyType::AttachedPoliciesPerGroupQuota     then "AttachedPoliciesPerGroupQuota"
      when AI::SummaryKeyType::AttachedPoliciesPerRoleQuota      then "AttachedPoliciesPerRoleQuota"
      when AI::SummaryKeyType::AttachedPoliciesPerUserQuota      then "AttachedPoliciesPerUserQuota"
      when AI::SummaryKeyType::Policies                          then "Policies"
      when AI::SummaryKeyType::PoliciesQuota                     then "PoliciesQuota"
      when AI::SummaryKeyType::PolicySizeQuota                   then "PolicySizeQuota"
      when AI::SummaryKeyType::PolicyVersionsInUse               then "PolicyVersionsInUse"
      when AI::SummaryKeyType::PolicyVersionsInUseQuota          then "PolicyVersionsInUseQuota"
      when AI::SummaryKeyType::VersionsPerPolicyQuota            then "VersionsPerPolicyQuota"
      when AI::SummaryKeyType::GlobalEndpointTokenVersion        then "GlobalEndpointTokenVersion"
      when AI::SummaryKeyType::AssumeRolePolicySizeQuota         then "AssumeRolePolicySizeQuota"
      when AI::SummaryKeyType::InstanceProfiles                  then "InstanceProfiles"
      when AI::SummaryKeyType::InstanceProfilesQuota             then "InstanceProfilesQuota"
      when AI::SummaryKeyType::Providers                         then "Providers"
      when AI::SummaryKeyType::RolePolicySizeQuota               then "RolePolicySizeQuota"
      when AI::SummaryKeyType::Roles                             then "Roles"
      when AI::SummaryKeyType::RolesQuota                        then "RolesQuota"
      else
        raise Exception.new("unknown enum value for 'SummaryKeyType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::SummaryKeyType?
      case key
      when "Users"                             then AI::SummaryKeyType::Users
      when "UsersQuota"                        then AI::SummaryKeyType::UsersQuota
      when "Groups"                            then AI::SummaryKeyType::Groups
      when "GroupsQuota"                       then AI::SummaryKeyType::GroupsQuota
      when "ServerCertificates"                then AI::SummaryKeyType::ServerCertificates
      when "ServerCertificatesQuota"           then AI::SummaryKeyType::ServerCertificatesQuota
      when "UserPolicySizeQuota"               then AI::SummaryKeyType::UserPolicySizeQuota
      when "GroupPolicySizeQuota"              then AI::SummaryKeyType::GroupPolicySizeQuota
      when "GroupsPerUserQuota"                then AI::SummaryKeyType::GroupsPerUserQuota
      when "SigningCertificatesPerUserQuota"   then AI::SummaryKeyType::SigningCertificatesPerUserQuota
      when "AccessKeysPerUserQuota"            then AI::SummaryKeyType::AccessKeysPerUserQuota
      when "MFADevices"                        then AI::SummaryKeyType::MfaDevices
      when "MFADevicesInUse"                   then AI::SummaryKeyType::MfaDevicesInUse
      when "AccountMFAEnabled"                 then AI::SummaryKeyType::AccountMfaEnabled
      when "AccountAccessKeysPresent"          then AI::SummaryKeyType::AccountAccessKeysPresent
      when "AccountPasswordPresent"            then AI::SummaryKeyType::AccountPasswordPresent
      when "AccountSigningCertificatesPresent" then AI::SummaryKeyType::AccountSigningCertificatesPresent
      when "AttachedPoliciesPerGroupQuota"     then AI::SummaryKeyType::AttachedPoliciesPerGroupQuota
      when "AttachedPoliciesPerRoleQuota"      then AI::SummaryKeyType::AttachedPoliciesPerRoleQuota
      when "AttachedPoliciesPerUserQuota"      then AI::SummaryKeyType::AttachedPoliciesPerUserQuota
      when "Policies"                          then AI::SummaryKeyType::Policies
      when "PoliciesQuota"                     then AI::SummaryKeyType::PoliciesQuota
      when "PolicySizeQuota"                   then AI::SummaryKeyType::PolicySizeQuota
      when "PolicyVersionsInUse"               then AI::SummaryKeyType::PolicyVersionsInUse
      when "PolicyVersionsInUseQuota"          then AI::SummaryKeyType::PolicyVersionsInUseQuota
      when "VersionsPerPolicyQuota"            then AI::SummaryKeyType::VersionsPerPolicyQuota
      when "GlobalEndpointTokenVersion"        then AI::SummaryKeyType::GlobalEndpointTokenVersion
      when "AssumeRolePolicySizeQuota"         then AI::SummaryKeyType::AssumeRolePolicySizeQuota
      when "InstanceProfiles"                  then AI::SummaryKeyType::InstanceProfiles
      when "InstanceProfilesQuota"             then AI::SummaryKeyType::InstanceProfilesQuota
      when "Providers"                         then AI::SummaryKeyType::Providers
      when "RolePolicySizeQuota"               then AI::SummaryKeyType::RolePolicySizeQuota
      when "Roles"                             then AI::SummaryKeyType::Roles
      when "RolesQuota"                        then AI::SummaryKeyType::RolesQuota
      else
        nil
      end
    end
  end
end
