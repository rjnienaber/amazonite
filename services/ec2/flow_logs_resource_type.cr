private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FlowLogsResourceType
    Vpc
    Subnet
    NetworkInterface
    TransitGateway
    TransitGatewayAttachment
    RegionalNatGateway

    def self.to_json(e : FlowLogsResourceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::FlowLogsResourceType::Vpc                      then "VPC"
              when AEC::FlowLogsResourceType::Subnet                   then "Subnet"
              when AEC::FlowLogsResourceType::NetworkInterface         then "NetworkInterface"
              when AEC::FlowLogsResourceType::TransitGateway           then "TransitGateway"
              when AEC::FlowLogsResourceType::TransitGatewayAttachment then "TransitGatewayAttachment"
              when AEC::FlowLogsResourceType::RegionalNatGateway       then "RegionalNatGateway"
              else
                raise Exception.new("unknown enum value for 'FlowLogsResourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FlowLogsResourceType
      value = pull.read_string
      case value
      when "VPC"                      then AEC::FlowLogsResourceType::Vpc
      when "Subnet"                   then AEC::FlowLogsResourceType::Subnet
      when "NetworkInterface"         then AEC::FlowLogsResourceType::NetworkInterface
      when "TransitGateway"           then AEC::FlowLogsResourceType::TransitGateway
      when "TransitGatewayAttachment" then AEC::FlowLogsResourceType::TransitGatewayAttachment
      when "RegionalNatGateway"       then AEC::FlowLogsResourceType::RegionalNatGateway
      else
        raise Exception.new("unknown enum value for 'FlowLogsResourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FlowLogsResourceType::Vpc                      then "VPC"
      when AEC::FlowLogsResourceType::Subnet                   then "Subnet"
      when AEC::FlowLogsResourceType::NetworkInterface         then "NetworkInterface"
      when AEC::FlowLogsResourceType::TransitGateway           then "TransitGateway"
      when AEC::FlowLogsResourceType::TransitGatewayAttachment then "TransitGatewayAttachment"
      when AEC::FlowLogsResourceType::RegionalNatGateway       then "RegionalNatGateway"
      else
        raise Exception.new("unknown enum value for 'FlowLogsResourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FlowLogsResourceType?
      case key
      when "VPC"                      then AEC::FlowLogsResourceType::Vpc
      when "Subnet"                   then AEC::FlowLogsResourceType::Subnet
      when "NetworkInterface"         then AEC::FlowLogsResourceType::NetworkInterface
      when "TransitGateway"           then AEC::FlowLogsResourceType::TransitGateway
      when "TransitGatewayAttachment" then AEC::FlowLogsResourceType::TransitGatewayAttachment
      when "RegionalNatGateway"       then AEC::FlowLogsResourceType::RegionalNatGateway
      else
        nil
      end
    end
  end
end
