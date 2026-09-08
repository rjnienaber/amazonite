private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransportProtocol
    Tcp
    Udp

    def self.to_json(e : TransportProtocol, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransportProtocol::Tcp then "tcp"
              when AEC::TransportProtocol::Udp then "udp"
              else
                raise Exception.new("unknown enum value for 'TransportProtocol' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransportProtocol
      value = pull.read_string
      case value
      when "tcp" then AEC::TransportProtocol::Tcp
      when "udp" then AEC::TransportProtocol::Udp
      else
        raise Exception.new("unknown enum value for 'TransportProtocol' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransportProtocol::Tcp then "tcp"
      when AEC::TransportProtocol::Udp then "udp"
      else
        raise Exception.new("unknown enum value for 'TransportProtocol' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransportProtocol?
      case key
      when "tcp" then AEC::TransportProtocol::Tcp
      when "udp" then AEC::TransportProtocol::Udp
      else
        nil
      end
    end
  end
end
