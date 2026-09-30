private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayRouteType
    Static
    Propagated

    def self.to_json(e : TransitGatewayRouteType, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayRouteType::Static     then "static"
              when AEC::TransitGatewayRouteType::Propagated then "propagated"
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
      else
        raise Exception.new("unknown enum value for 'TransitGatewayRouteType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayRouteType::Static     then "static"
      when AEC::TransitGatewayRouteType::Propagated then "propagated"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayRouteType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayRouteType?
      case key
      when "static"     then AEC::TransitGatewayRouteType::Static
      when "propagated" then AEC::TransitGatewayRouteType::Propagated
      else
        nil
      end
    end
  end
end
