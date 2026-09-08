private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ApplianceModeSupportValue
    Enable
    Disable

    def self.to_json(e : ApplianceModeSupportValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::ApplianceModeSupportValue::Enable  then "enable"
              when AEC::ApplianceModeSupportValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'ApplianceModeSupportValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ApplianceModeSupportValue
      value = pull.read_string
      case value
      when "enable"  then AEC::ApplianceModeSupportValue::Enable
      when "disable" then AEC::ApplianceModeSupportValue::Disable
      else
        raise Exception.new("unknown enum value for 'ApplianceModeSupportValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ApplianceModeSupportValue::Enable  then "enable"
      when AEC::ApplianceModeSupportValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'ApplianceModeSupportValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ApplianceModeSupportValue?
      case key
      when "enable"  then AEC::ApplianceModeSupportValue::Enable
      when "disable" then AEC::ApplianceModeSupportValue::Disable
      else
        nil
      end
    end
  end
end
