private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SecurityGroupReferencingSupportValue
    Enable
    Disable

    def self.to_json(e : SecurityGroupReferencingSupportValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::SecurityGroupReferencingSupportValue::Enable  then "enable"
              when AEC::SecurityGroupReferencingSupportValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'SecurityGroupReferencingSupportValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SecurityGroupReferencingSupportValue
      value = pull.read_string
      case value
      when "enable"  then AEC::SecurityGroupReferencingSupportValue::Enable
      when "disable" then AEC::SecurityGroupReferencingSupportValue::Disable
      else
        raise Exception.new("unknown enum value for 'SecurityGroupReferencingSupportValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SecurityGroupReferencingSupportValue::Enable  then "enable"
      when AEC::SecurityGroupReferencingSupportValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'SecurityGroupReferencingSupportValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SecurityGroupReferencingSupportValue?
      case key
      when "enable"  then AEC::SecurityGroupReferencingSupportValue::Enable
      when "disable" then AEC::SecurityGroupReferencingSupportValue::Disable
      else
        nil
      end
    end
  end
end
