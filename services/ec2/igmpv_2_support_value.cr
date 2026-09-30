private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum Igmpv2SupportValue
    Enable
    Disable

    def self.to_json(e : Igmpv2SupportValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::Igmpv2SupportValue::Enable  then "enable"
              when AEC::Igmpv2SupportValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'Igmpv2SupportValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::Igmpv2SupportValue
      value = pull.read_string
      case value
      when "enable"  then AEC::Igmpv2SupportValue::Enable
      when "disable" then AEC::Igmpv2SupportValue::Disable
      else
        raise Exception.new("unknown enum value for 'Igmpv2SupportValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::Igmpv2SupportValue::Enable  then "enable"
      when AEC::Igmpv2SupportValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'Igmpv2SupportValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::Igmpv2SupportValue?
      case key
      when "enable"  then AEC::Igmpv2SupportValue::Enable
      when "disable" then AEC::Igmpv2SupportValue::Disable
      else
        nil
      end
    end
  end
end
