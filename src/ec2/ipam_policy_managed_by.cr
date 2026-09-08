private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPolicyManagedBy
    Account
    DelegatedAdministratorForIpam

    def self.to_json(e : IpamPolicyManagedBy, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPolicyManagedBy::Account                       then "account"
              when AEC::IpamPolicyManagedBy::DelegatedAdministratorForIpam then "delegated-administrator-for-ipam"
              else
                raise Exception.new("unknown enum value for 'IpamPolicyManagedBy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPolicyManagedBy
      value = pull.read_string
      case value
      when "account"                          then AEC::IpamPolicyManagedBy::Account
      when "delegated-administrator-for-ipam" then AEC::IpamPolicyManagedBy::DelegatedAdministratorForIpam
      else
        raise Exception.new("unknown enum value for 'IpamPolicyManagedBy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPolicyManagedBy::Account                       then "account"
      when AEC::IpamPolicyManagedBy::DelegatedAdministratorForIpam then "delegated-administrator-for-ipam"
      else
        raise Exception.new("unknown enum value for 'IpamPolicyManagedBy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPolicyManagedBy?
      case key
      when "account"                          then AEC::IpamPolicyManagedBy::Account
      when "delegated-administrator-for-ipam" then AEC::IpamPolicyManagedBy::DelegatedAdministratorForIpam
      else
        nil
      end
    end
  end
end
