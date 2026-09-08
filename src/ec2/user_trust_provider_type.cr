private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum UserTrustProviderType
    IamIdentityCenter
    Oidc

    def self.to_json(e : UserTrustProviderType, json : JSON::Builder) : Nil
      value = case e
              when AEC::UserTrustProviderType::IamIdentityCenter then "iam-identity-center"
              when AEC::UserTrustProviderType::Oidc              then "oidc"
              else
                raise Exception.new("unknown enum value for 'UserTrustProviderType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::UserTrustProviderType
      value = pull.read_string
      case value
      when "iam-identity-center" then AEC::UserTrustProviderType::IamIdentityCenter
      when "oidc"                then AEC::UserTrustProviderType::Oidc
      else
        raise Exception.new("unknown enum value for 'UserTrustProviderType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::UserTrustProviderType::IamIdentityCenter then "iam-identity-center"
      when AEC::UserTrustProviderType::Oidc              then "oidc"
      else
        raise Exception.new("unknown enum value for 'UserTrustProviderType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::UserTrustProviderType?
      case key
      when "iam-identity-center" then AEC::UserTrustProviderType::IamIdentityCenter
      when "oidc"                then AEC::UserTrustProviderType::Oidc
      else
        nil
      end
    end
  end
end
