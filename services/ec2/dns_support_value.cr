private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DnsSupportValue
    Enable
    Disable

    def self.to_json(e : DnsSupportValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::DnsSupportValue::Enable  then "enable"
              when AEC::DnsSupportValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'DnsSupportValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DnsSupportValue
      value = pull.read_string
      case value
      when "enable"  then AEC::DnsSupportValue::Enable
      when "disable" then AEC::DnsSupportValue::Disable
      else
        raise Exception.new("unknown enum value for 'DnsSupportValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DnsSupportValue::Enable  then "enable"
      when AEC::DnsSupportValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'DnsSupportValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DnsSupportValue?
      case key
      when "enable"  then AEC::DnsSupportValue::Enable
      when "disable" then AEC::DnsSupportValue::Disable
      else
        nil
      end
    end
  end
end
