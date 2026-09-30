private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RouteServerPeerLivenessMode
    Bfd
    BgpKeepalive

    def self.to_json(e : RouteServerPeerLivenessMode, json : JSON::Builder) : Nil
      value = case e
              when AEC::RouteServerPeerLivenessMode::Bfd          then "bfd"
              when AEC::RouteServerPeerLivenessMode::BgpKeepalive then "bgp-keepalive"
              else
                raise Exception.new("unknown enum value for 'RouteServerPeerLivenessMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RouteServerPeerLivenessMode
      value = pull.read_string
      case value
      when "bfd"           then AEC::RouteServerPeerLivenessMode::Bfd
      when "bgp-keepalive" then AEC::RouteServerPeerLivenessMode::BgpKeepalive
      else
        raise Exception.new("unknown enum value for 'RouteServerPeerLivenessMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RouteServerPeerLivenessMode::Bfd          then "bfd"
      when AEC::RouteServerPeerLivenessMode::BgpKeepalive then "bgp-keepalive"
      else
        raise Exception.new("unknown enum value for 'RouteServerPeerLivenessMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RouteServerPeerLivenessMode?
      case key
      when "bfd"           then AEC::RouteServerPeerLivenessMode::Bfd
      when "bgp-keepalive" then AEC::RouteServerPeerLivenessMode::BgpKeepalive
      else
        nil
      end
    end
  end
end
