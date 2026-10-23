private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayAttachmentNatSystemRouteSupportValue
    Enable
    Disable

    def self.to_json(e : TransitGatewayAttachmentNatSystemRouteSupportValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayAttachmentNatSystemRouteSupportValue::Enable  then "enable"
              when AEC::TransitGatewayAttachmentNatSystemRouteSupportValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayAttachmentNatSystemRouteSupportValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayAttachmentNatSystemRouteSupportValue
      value = pull.read_string
      case value
      when "enable"  then AEC::TransitGatewayAttachmentNatSystemRouteSupportValue::Enable
      when "disable" then AEC::TransitGatewayAttachmentNatSystemRouteSupportValue::Disable
      else
        raise Exception.new("unknown enum value for 'TransitGatewayAttachmentNatSystemRouteSupportValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayAttachmentNatSystemRouteSupportValue::Enable  then "enable"
      when AEC::TransitGatewayAttachmentNatSystemRouteSupportValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayAttachmentNatSystemRouteSupportValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayAttachmentNatSystemRouteSupportValue?
      case key
      when "enable"  then AEC::TransitGatewayAttachmentNatSystemRouteSupportValue::Enable
      when "disable" then AEC::TransitGatewayAttachmentNatSystemRouteSupportValue::Disable
      else
        nil
      end
    end
  end
end
