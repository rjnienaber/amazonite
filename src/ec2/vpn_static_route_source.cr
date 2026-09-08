private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpnStaticRouteSource
    Static

    def self.to_json(e : VpnStaticRouteSource, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpnStaticRouteSource
      value = pull.read_string
      case value
      when "Static" then AEC::VpnStaticRouteSource::Static
      else
        raise Exception.new("unknown enum value for 'VpnStaticRouteSource' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AEC::VpnStaticRouteSource?
      case key
      when "Static" then AEC::VpnStaticRouteSource::Static
      else
        nil
      end
    end
  end
end
