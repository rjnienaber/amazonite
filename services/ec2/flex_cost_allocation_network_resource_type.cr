private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The type of network resource that a flex cost allocation policy applies to. Valid values are
  # `natgw` (NAT gateway), `pcx` (Amazon VPC peering connection), and `ec2` (EC2 instance).
  enum FlexCostAllocationNetworkResourceType
    Natgw
    Pcx
    Ec2

    def self.to_json(e : FlexCostAllocationNetworkResourceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::FlexCostAllocationNetworkResourceType::Natgw then "natgw"
              when AEC::FlexCostAllocationNetworkResourceType::Pcx   then "pcx"
              when AEC::FlexCostAllocationNetworkResourceType::Ec2   then "ec2"
              else
                raise Exception.new("unknown enum value for 'FlexCostAllocationNetworkResourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FlexCostAllocationNetworkResourceType
      value = pull.read_string
      case value
      when "natgw" then AEC::FlexCostAllocationNetworkResourceType::Natgw
      when "pcx"   then AEC::FlexCostAllocationNetworkResourceType::Pcx
      when "ec2"   then AEC::FlexCostAllocationNetworkResourceType::Ec2
      else
        raise Exception.new("unknown enum value for 'FlexCostAllocationNetworkResourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FlexCostAllocationNetworkResourceType::Natgw then "natgw"
      when AEC::FlexCostAllocationNetworkResourceType::Pcx   then "pcx"
      when AEC::FlexCostAllocationNetworkResourceType::Ec2   then "ec2"
      else
        raise Exception.new("unknown enum value for 'FlexCostAllocationNetworkResourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FlexCostAllocationNetworkResourceType?
      case key
      when "natgw" then AEC::FlexCostAllocationNetworkResourceType::Natgw
      when "pcx"   then AEC::FlexCostAllocationNetworkResourceType::Pcx
      when "ec2"   then AEC::FlexCostAllocationNetworkResourceType::Ec2
      else
        nil
      end
    end
  end
end
