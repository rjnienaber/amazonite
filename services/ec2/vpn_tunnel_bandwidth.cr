private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpnTunnelBandwidth
    Standard
    Large

    def self.to_json(e : VpnTunnelBandwidth, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpnTunnelBandwidth::Standard then "standard"
              when AEC::VpnTunnelBandwidth::Large    then "large"
              else
                raise Exception.new("unknown enum value for 'VpnTunnelBandwidth' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpnTunnelBandwidth
      value = pull.read_string
      case value
      when "standard" then AEC::VpnTunnelBandwidth::Standard
      when "large"    then AEC::VpnTunnelBandwidth::Large
      else
        raise Exception.new("unknown enum value for 'VpnTunnelBandwidth' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpnTunnelBandwidth::Standard then "standard"
      when AEC::VpnTunnelBandwidth::Large    then "large"
      else
        raise Exception.new("unknown enum value for 'VpnTunnelBandwidth' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpnTunnelBandwidth?
      case key
      when "standard" then AEC::VpnTunnelBandwidth::Standard
      when "large"    then AEC::VpnTunnelBandwidth::Large
      else
        nil
      end
    end
  end
end
