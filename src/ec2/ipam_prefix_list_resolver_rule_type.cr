private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPrefixListResolverRuleType
    StaticCidr
    IpamResourceCidr
    IpamPoolCidr

    def self.to_json(e : IpamPrefixListResolverRuleType, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPrefixListResolverRuleType::StaticCidr       then "static-cidr"
              when AEC::IpamPrefixListResolverRuleType::IpamResourceCidr then "ipam-resource-cidr"
              when AEC::IpamPrefixListResolverRuleType::IpamPoolCidr     then "ipam-pool-cidr"
              else
                raise Exception.new("unknown enum value for 'IpamPrefixListResolverRuleType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPrefixListResolverRuleType
      value = pull.read_string
      case value
      when "static-cidr"        then AEC::IpamPrefixListResolverRuleType::StaticCidr
      when "ipam-resource-cidr" then AEC::IpamPrefixListResolverRuleType::IpamResourceCidr
      when "ipam-pool-cidr"     then AEC::IpamPrefixListResolverRuleType::IpamPoolCidr
      else
        raise Exception.new("unknown enum value for 'IpamPrefixListResolverRuleType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPrefixListResolverRuleType::StaticCidr       then "static-cidr"
      when AEC::IpamPrefixListResolverRuleType::IpamResourceCidr then "ipam-resource-cidr"
      when AEC::IpamPrefixListResolverRuleType::IpamPoolCidr     then "ipam-pool-cidr"
      else
        raise Exception.new("unknown enum value for 'IpamPrefixListResolverRuleType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPrefixListResolverRuleType?
      case key
      when "static-cidr"        then AEC::IpamPrefixListResolverRuleType::StaticCidr
      when "ipam-resource-cidr" then AEC::IpamPrefixListResolverRuleType::IpamResourceCidr
      when "ipam-pool-cidr"     then AEC::IpamPrefixListResolverRuleType::IpamPoolCidr
      else
        nil
      end
    end
  end
end
