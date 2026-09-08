private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DefaultRouteTablePropagationValue
    Enable
    Disable

    def self.to_json(e : DefaultRouteTablePropagationValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::DefaultRouteTablePropagationValue::Enable  then "enable"
              when AEC::DefaultRouteTablePropagationValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'DefaultRouteTablePropagationValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DefaultRouteTablePropagationValue
      value = pull.read_string
      case value
      when "enable"  then AEC::DefaultRouteTablePropagationValue::Enable
      when "disable" then AEC::DefaultRouteTablePropagationValue::Disable
      else
        raise Exception.new("unknown enum value for 'DefaultRouteTablePropagationValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DefaultRouteTablePropagationValue::Enable  then "enable"
      when AEC::DefaultRouteTablePropagationValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'DefaultRouteTablePropagationValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DefaultRouteTablePropagationValue?
      case key
      when "enable"  then AEC::DefaultRouteTablePropagationValue::Enable
      when "disable" then AEC::DefaultRouteTablePropagationValue::Disable
      else
        nil
      end
    end
  end
end
