private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum Ipv6SupportValue
    Enable
    Disable

    def self.to_json(e : Ipv6SupportValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::Ipv6SupportValue::Enable  then "enable"
              when AEC::Ipv6SupportValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'Ipv6SupportValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::Ipv6SupportValue
      value = pull.read_string
      case value
      when "enable"  then AEC::Ipv6SupportValue::Enable
      when "disable" then AEC::Ipv6SupportValue::Disable
      else
        raise Exception.new("unknown enum value for 'Ipv6SupportValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::Ipv6SupportValue::Enable  then "enable"
      when AEC::Ipv6SupportValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'Ipv6SupportValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::Ipv6SupportValue?
      case key
      when "enable"  then AEC::Ipv6SupportValue::Enable
      when "disable" then AEC::Ipv6SupportValue::Disable
      else
        nil
      end
    end
  end
end
