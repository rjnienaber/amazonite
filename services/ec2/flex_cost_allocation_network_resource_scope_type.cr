private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The type of scope used for a scope-based policy association. Valid values are `account`, `vpc`,
  # and `subnet`.
  enum FlexCostAllocationNetworkResourceScopeType
    Account
    Vpc
    Subnet

    def self.to_json(e : FlexCostAllocationNetworkResourceScopeType, json : JSON::Builder) : Nil
      value = case e
              when AEC::FlexCostAllocationNetworkResourceScopeType::Account then "account"
              when AEC::FlexCostAllocationNetworkResourceScopeType::Vpc     then "vpc"
              when AEC::FlexCostAllocationNetworkResourceScopeType::Subnet  then "subnet"
              else
                raise Exception.new("unknown enum value for 'FlexCostAllocationNetworkResourceScopeType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FlexCostAllocationNetworkResourceScopeType
      value = pull.read_string
      case value
      when "account" then AEC::FlexCostAllocationNetworkResourceScopeType::Account
      when "vpc"     then AEC::FlexCostAllocationNetworkResourceScopeType::Vpc
      when "subnet"  then AEC::FlexCostAllocationNetworkResourceScopeType::Subnet
      else
        raise Exception.new("unknown enum value for 'FlexCostAllocationNetworkResourceScopeType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FlexCostAllocationNetworkResourceScopeType::Account then "account"
      when AEC::FlexCostAllocationNetworkResourceScopeType::Vpc     then "vpc"
      when AEC::FlexCostAllocationNetworkResourceScopeType::Subnet  then "subnet"
      else
        raise Exception.new("unknown enum value for 'FlexCostAllocationNetworkResourceScopeType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FlexCostAllocationNetworkResourceScopeType?
      case key
      when "account" then AEC::FlexCostAllocationNetworkResourceScopeType::Account
      when "vpc"     then AEC::FlexCostAllocationNetworkResourceScopeType::Vpc
      when "subnet"  then AEC::FlexCostAllocationNetworkResourceScopeType::Subnet
      else
        nil
      end
    end
  end
end
