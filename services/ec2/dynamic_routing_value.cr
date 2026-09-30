private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DynamicRoutingValue
    Enable
    Disable

    def self.to_json(e : DynamicRoutingValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::DynamicRoutingValue::Enable  then "enable"
              when AEC::DynamicRoutingValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'DynamicRoutingValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DynamicRoutingValue
      value = pull.read_string
      case value
      when "enable"  then AEC::DynamicRoutingValue::Enable
      when "disable" then AEC::DynamicRoutingValue::Disable
      else
        raise Exception.new("unknown enum value for 'DynamicRoutingValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DynamicRoutingValue::Enable  then "enable"
      when AEC::DynamicRoutingValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'DynamicRoutingValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DynamicRoutingValue?
      case key
      when "enable"  then AEC::DynamicRoutingValue::Enable
      when "disable" then AEC::DynamicRoutingValue::Disable
      else
        nil
      end
    end
  end
end
