private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RouteServerRouteStatus
    InRib
    InFib

    def self.to_json(e : RouteServerRouteStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::RouteServerRouteStatus::InRib then "in-rib"
              when AEC::RouteServerRouteStatus::InFib then "in-fib"
              else
                raise Exception.new("unknown enum value for 'RouteServerRouteStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RouteServerRouteStatus
      value = pull.read_string
      case value
      when "in-rib" then AEC::RouteServerRouteStatus::InRib
      when "in-fib" then AEC::RouteServerRouteStatus::InFib
      else
        raise Exception.new("unknown enum value for 'RouteServerRouteStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RouteServerRouteStatus::InRib then "in-rib"
      when AEC::RouteServerRouteStatus::InFib then "in-fib"
      else
        raise Exception.new("unknown enum value for 'RouteServerRouteStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RouteServerRouteStatus?
      case key
      when "in-rib" then AEC::RouteServerRouteStatus::InRib
      when "in-fib" then AEC::RouteServerRouteStatus::InFib
      else
        nil
      end
    end
  end
end
