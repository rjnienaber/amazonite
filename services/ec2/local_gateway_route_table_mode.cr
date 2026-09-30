private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LocalGatewayRouteTableMode
    DirectVpcRouting
    Coip

    def self.to_json(e : LocalGatewayRouteTableMode, json : JSON::Builder) : Nil
      value = case e
              when AEC::LocalGatewayRouteTableMode::DirectVpcRouting then "direct-vpc-routing"
              when AEC::LocalGatewayRouteTableMode::Coip             then "coip"
              else
                raise Exception.new("unknown enum value for 'LocalGatewayRouteTableMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LocalGatewayRouteTableMode
      value = pull.read_string
      case value
      when "direct-vpc-routing" then AEC::LocalGatewayRouteTableMode::DirectVpcRouting
      when "coip"               then AEC::LocalGatewayRouteTableMode::Coip
      else
        raise Exception.new("unknown enum value for 'LocalGatewayRouteTableMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LocalGatewayRouteTableMode::DirectVpcRouting then "direct-vpc-routing"
      when AEC::LocalGatewayRouteTableMode::Coip             then "coip"
      else
        raise Exception.new("unknown enum value for 'LocalGatewayRouteTableMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LocalGatewayRouteTableMode?
      case key
      when "direct-vpc-routing" then AEC::LocalGatewayRouteTableMode::DirectVpcRouting
      when "coip"               then AEC::LocalGatewayRouteTableMode::Coip
      else
        nil
      end
    end
  end
end
