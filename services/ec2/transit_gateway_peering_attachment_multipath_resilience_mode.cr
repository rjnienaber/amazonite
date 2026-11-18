private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayPeeringAttachmentMultipathResilienceMode
    AlwaysOn

    def self.to_json(e : TransitGatewayPeeringAttachmentMultipathResilienceMode, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayPeeringAttachmentMultipathResilienceMode::AlwaysOn then "always-on"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayPeeringAttachmentMultipathResilienceMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayPeeringAttachmentMultipathResilienceMode
      value = pull.read_string
      case value
      when "always-on" then AEC::TransitGatewayPeeringAttachmentMultipathResilienceMode::AlwaysOn
      else
        raise Exception.new("unknown enum value for 'TransitGatewayPeeringAttachmentMultipathResilienceMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayPeeringAttachmentMultipathResilienceMode::AlwaysOn then "always-on"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayPeeringAttachmentMultipathResilienceMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayPeeringAttachmentMultipathResilienceMode?
      case key
      when "always-on" then AEC::TransitGatewayPeeringAttachmentMultipathResilienceMode::AlwaysOn
      else
        nil
      end
    end
  end
end
