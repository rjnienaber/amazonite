private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayAttachmentNatGatewaySupportValue
    Enable
    Disable

    def self.to_json(e : TransitGatewayAttachmentNatGatewaySupportValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayAttachmentNatGatewaySupportValue::Enable  then "enable"
              when AEC::TransitGatewayAttachmentNatGatewaySupportValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayAttachmentNatGatewaySupportValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayAttachmentNatGatewaySupportValue
      value = pull.read_string
      case value
      when "enable"  then AEC::TransitGatewayAttachmentNatGatewaySupportValue::Enable
      when "disable" then AEC::TransitGatewayAttachmentNatGatewaySupportValue::Disable
      else
        raise Exception.new("unknown enum value for 'TransitGatewayAttachmentNatGatewaySupportValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayAttachmentNatGatewaySupportValue::Enable  then "enable"
      when AEC::TransitGatewayAttachmentNatGatewaySupportValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayAttachmentNatGatewaySupportValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayAttachmentNatGatewaySupportValue?
      case key
      when "enable"  then AEC::TransitGatewayAttachmentNatGatewaySupportValue::Enable
      when "disable" then AEC::TransitGatewayAttachmentNatGatewaySupportValue::Disable
      else
        nil
      end
    end
  end
end
