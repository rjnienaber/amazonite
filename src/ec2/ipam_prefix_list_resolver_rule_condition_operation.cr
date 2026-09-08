private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPrefixListResolverRuleConditionOperation
    Equals
    NotEquals
    SubnetOf

    def self.to_json(e : IpamPrefixListResolverRuleConditionOperation, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPrefixListResolverRuleConditionOperation::Equals    then "equals"
              when AEC::IpamPrefixListResolverRuleConditionOperation::NotEquals then "not-equals"
              when AEC::IpamPrefixListResolverRuleConditionOperation::SubnetOf  then "subnet-of"
              else
                raise Exception.new("unknown enum value for 'IpamPrefixListResolverRuleConditionOperation' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPrefixListResolverRuleConditionOperation
      value = pull.read_string
      case value
      when "equals"     then AEC::IpamPrefixListResolverRuleConditionOperation::Equals
      when "not-equals" then AEC::IpamPrefixListResolverRuleConditionOperation::NotEquals
      when "subnet-of"  then AEC::IpamPrefixListResolverRuleConditionOperation::SubnetOf
      else
        raise Exception.new("unknown enum value for 'IpamPrefixListResolverRuleConditionOperation' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPrefixListResolverRuleConditionOperation::Equals    then "equals"
      when AEC::IpamPrefixListResolverRuleConditionOperation::NotEquals then "not-equals"
      when AEC::IpamPrefixListResolverRuleConditionOperation::SubnetOf  then "subnet-of"
      else
        raise Exception.new("unknown enum value for 'IpamPrefixListResolverRuleConditionOperation' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPrefixListResolverRuleConditionOperation?
      case key
      when "equals"     then AEC::IpamPrefixListResolverRuleConditionOperation::Equals
      when "not-equals" then AEC::IpamPrefixListResolverRuleConditionOperation::NotEquals
      when "subnet-of"  then AEC::IpamPrefixListResolverRuleConditionOperation::SubnetOf
      else
        nil
      end
    end
  end
end
