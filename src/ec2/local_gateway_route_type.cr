private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LocalGatewayRouteType
    Static
    Propagated

    def self.to_json(e : LocalGatewayRouteType, json : JSON::Builder) : Nil
      value = case e
              when AEC::LocalGatewayRouteType::Static     then "static"
              when AEC::LocalGatewayRouteType::Propagated then "propagated"
              else
                raise Exception.new("unknown enum value for 'LocalGatewayRouteType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LocalGatewayRouteType
      value = pull.read_string
      case value
      when "static"     then AEC::LocalGatewayRouteType::Static
      when "propagated" then AEC::LocalGatewayRouteType::Propagated
      else
        raise Exception.new("unknown enum value for 'LocalGatewayRouteType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LocalGatewayRouteType::Static     then "static"
      when AEC::LocalGatewayRouteType::Propagated then "propagated"
      else
        raise Exception.new("unknown enum value for 'LocalGatewayRouteType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LocalGatewayRouteType?
      case key
      when "static"     then AEC::LocalGatewayRouteType::Static
      when "propagated" then AEC::LocalGatewayRouteType::Propagated
      else
        nil
      end
    end
  end
end
