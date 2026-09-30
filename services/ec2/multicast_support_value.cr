private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum MulticastSupportValue
    Enable
    Disable

    def self.to_json(e : MulticastSupportValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::MulticastSupportValue::Enable  then "enable"
              when AEC::MulticastSupportValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'MulticastSupportValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::MulticastSupportValue
      value = pull.read_string
      case value
      when "enable"  then AEC::MulticastSupportValue::Enable
      when "disable" then AEC::MulticastSupportValue::Disable
      else
        raise Exception.new("unknown enum value for 'MulticastSupportValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::MulticastSupportValue::Enable  then "enable"
      when AEC::MulticastSupportValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'MulticastSupportValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::MulticastSupportValue?
      case key
      when "enable"  then AEC::MulticastSupportValue::Enable
      when "disable" then AEC::MulticastSupportValue::Disable
      else
        nil
      end
    end
  end
end
