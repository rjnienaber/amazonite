private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpnConcentratorType
    Ipsec1

    def self.to_json(e : VpnConcentratorType, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpnConcentratorType::Ipsec1 then "ipsec.1"
              else
                raise Exception.new("unknown enum value for 'VpnConcentratorType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpnConcentratorType
      value = pull.read_string
      case value
      when "ipsec.1" then AEC::VpnConcentratorType::Ipsec1
      else
        raise Exception.new("unknown enum value for 'VpnConcentratorType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpnConcentratorType::Ipsec1 then "ipsec.1"
      else
        raise Exception.new("unknown enum value for 'VpnConcentratorType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpnConcentratorType?
      case key
      when "ipsec.1" then AEC::VpnConcentratorType::Ipsec1
      else
        nil
      end
    end
  end
end
