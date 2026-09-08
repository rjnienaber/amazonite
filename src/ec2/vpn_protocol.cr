private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpnProtocol
    Openvpn

    def self.to_json(e : VpnProtocol, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpnProtocol::Openvpn then "openvpn"
              else
                raise Exception.new("unknown enum value for 'VpnProtocol' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpnProtocol
      value = pull.read_string
      case value
      when "openvpn" then AEC::VpnProtocol::Openvpn
      else
        raise Exception.new("unknown enum value for 'VpnProtocol' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpnProtocol::Openvpn then "openvpn"
      else
        raise Exception.new("unknown enum value for 'VpnProtocol' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpnProtocol?
      case key
      when "openvpn" then AEC::VpnProtocol::Openvpn
      else
        nil
      end
    end
  end
end
