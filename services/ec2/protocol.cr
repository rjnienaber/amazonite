private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum Protocol
    Tcp
    Udp

    def self.to_json(e : Protocol, json : JSON::Builder) : Nil
      value = case e
              when AEC::Protocol::Tcp then "tcp"
              when AEC::Protocol::Udp then "udp"
              else
                raise Exception.new("unknown enum value for 'Protocol' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::Protocol
      value = pull.read_string
      case value
      when "tcp" then AEC::Protocol::Tcp
      when "udp" then AEC::Protocol::Udp
      else
        raise Exception.new("unknown enum value for 'Protocol' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::Protocol::Tcp then "tcp"
      when AEC::Protocol::Udp then "udp"
      else
        raise Exception.new("unknown enum value for 'Protocol' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::Protocol?
      case key
      when "tcp" then AEC::Protocol::Tcp
      when "udp" then AEC::Protocol::Udp
      else
        nil
      end
    end
  end
end
