private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayRouteType
    Static
    Propagated
    System

    def self.to_json(e : TransitGatewayRouteType, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayRouteType::Static     then "static"
              when AEC::TransitGatewayRouteType::Propagated then "propagated"
              when AEC::TransitGatewayRouteType::System     then "system"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayRouteType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayRouteType
      value = pull.read_string
      case value
      when "static"     then AEC::TransitGatewayRouteType::Static
      when "propagated" then AEC::TransitGatewayRouteType::Propagated
      when "system"     then AEC::TransitGatewayRouteType::System
      else
        raise Exception.new("unknown enum value for 'TransitGatewayRouteType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayRouteType::Static     then "static"
      when AEC::TransitGatewayRouteType::Propagated then "propagated"
      when AEC::TransitGatewayRouteType::System     then "system"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayRouteType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayRouteType?
      case key
      when "static"     then AEC::TransitGatewayRouteType::Static
      when "propagated" then AEC::TransitGatewayRouteType::Propagated
      when "system"     then AEC::TransitGatewayRouteType::System
      else
        nil
      end
    end
  end
end
