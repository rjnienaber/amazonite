private alias AK = Amazonite::Kms

module Amazonite::Kms
  # Identifies whose KMS keys ListKeys lists. `SELF` identifies the KMS keys in your Amazon Web
  # Services account. `OTHER_ACCOUNTS_VIA_RAM` identifies the KMS keys that other Amazon Web
  # Services accounts shared with your Amazon Web Services account through Resource Access Manager
  # (RAM).
  enum ResourceOwnerType
    Self
    OtherAccountsViaRam

    def self.to_json(e : ResourceOwnerType, json : JSON::Builder) : Nil
      value = case e
              when AK::ResourceOwnerType::Self                then "SELF"
              when AK::ResourceOwnerType::OtherAccountsViaRam then "OTHER_ACCOUNTS_VIA_RAM"
              else
                raise Exception.new("unknown enum value for 'ResourceOwnerType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::ResourceOwnerType
      value = pull.read_string
      case value
      when "SELF"                   then AK::ResourceOwnerType::Self
      when "OTHER_ACCOUNTS_VIA_RAM" then AK::ResourceOwnerType::OtherAccountsViaRam
      else
        raise Exception.new("unknown enum value for 'ResourceOwnerType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::ResourceOwnerType::Self                then "SELF"
      when AK::ResourceOwnerType::OtherAccountsViaRam then "OTHER_ACCOUNTS_VIA_RAM"
      else
        raise Exception.new("unknown enum value for 'ResourceOwnerType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::ResourceOwnerType?
      case key
      when "SELF"                   then AK::ResourceOwnerType::Self
      when "OTHER_ACCOUNTS_VIA_RAM" then AK::ResourceOwnerType::OtherAccountsViaRam
      else
        nil
      end
    end
  end
end
