private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum StaticSourcesSupportValue
    Enable
    Disable

    def self.to_json(e : StaticSourcesSupportValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::StaticSourcesSupportValue::Enable  then "enable"
              when AEC::StaticSourcesSupportValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'StaticSourcesSupportValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::StaticSourcesSupportValue
      value = pull.read_string
      case value
      when "enable"  then AEC::StaticSourcesSupportValue::Enable
      when "disable" then AEC::StaticSourcesSupportValue::Disable
      else
        raise Exception.new("unknown enum value for 'StaticSourcesSupportValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::StaticSourcesSupportValue::Enable  then "enable"
      when AEC::StaticSourcesSupportValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'StaticSourcesSupportValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::StaticSourcesSupportValue?
      case key
      when "enable"  then AEC::StaticSourcesSupportValue::Enable
      when "disable" then AEC::StaticSourcesSupportValue::Disable
      else
        nil
      end
    end
  end
end
