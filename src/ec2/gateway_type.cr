private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum GatewayType
    Ipsec1

    def self.to_json(e : GatewayType, json : JSON::Builder) : Nil
      value = case e
              when AEC::GatewayType::Ipsec1 then "ipsec.1"
              else
                raise Exception.new("unknown enum value for 'GatewayType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::GatewayType
      value = pull.read_string
      case value
      when "ipsec.1" then AEC::GatewayType::Ipsec1
      else
        raise Exception.new("unknown enum value for 'GatewayType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::GatewayType::Ipsec1 then "ipsec.1"
      else
        raise Exception.new("unknown enum value for 'GatewayType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::GatewayType?
      case key
      when "ipsec.1" then AEC::GatewayType::Ipsec1
      else
        nil
      end
    end
  end
end
