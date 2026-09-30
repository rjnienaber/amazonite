private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NetworkProtocolEnum
    Http
    Https

    def self.to_json(e : NetworkProtocolEnum, json : JSON::Builder) : Nil
      value = case e
              when AEC::NetworkProtocolEnum::Http  then "http"
              when AEC::NetworkProtocolEnum::Https then "https"
              else
                raise Exception.new("unknown enum value for 'NetworkProtocolEnum' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NetworkProtocolEnum
      value = pull.read_string
      case value
      when "http"  then AEC::NetworkProtocolEnum::Http
      when "https" then AEC::NetworkProtocolEnum::Https
      else
        raise Exception.new("unknown enum value for 'NetworkProtocolEnum' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NetworkProtocolEnum::Http  then "http"
      when AEC::NetworkProtocolEnum::Https then "https"
      else
        raise Exception.new("unknown enum value for 'NetworkProtocolEnum' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NetworkProtocolEnum?
      case key
      when "http"  then AEC::NetworkProtocolEnum::Http
      when "https" then AEC::NetworkProtocolEnum::Https
      else
        nil
      end
    end
  end
end
