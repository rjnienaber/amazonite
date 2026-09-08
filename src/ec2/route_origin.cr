private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RouteOrigin
    CreateRouteTable
    CreateRoute
    EnableVgwRoutePropagation
    Advertisement

    def self.to_json(e : RouteOrigin, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RouteOrigin
      value = pull.read_string
      case value
      when "CreateRouteTable"          then AEC::RouteOrigin::CreateRouteTable
      when "CreateRoute"               then AEC::RouteOrigin::CreateRoute
      when "EnableVgwRoutePropagation" then AEC::RouteOrigin::EnableVgwRoutePropagation
      when "Advertisement"             then AEC::RouteOrigin::Advertisement
      else
        raise Exception.new("unknown enum value for 'RouteOrigin' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AEC::RouteOrigin?
      case key
      when "CreateRouteTable"          then AEC::RouteOrigin::CreateRouteTable
      when "CreateRoute"               then AEC::RouteOrigin::CreateRoute
      when "EnableVgwRoutePropagation" then AEC::RouteOrigin::EnableVgwRoutePropagation
      when "Advertisement"             then AEC::RouteOrigin::Advertisement
      else
        nil
      end
    end
  end
end
