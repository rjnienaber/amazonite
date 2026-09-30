private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpnEcmpSupportValue
    Enable
    Disable

    def self.to_json(e : VpnEcmpSupportValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpnEcmpSupportValue::Enable  then "enable"
              when AEC::VpnEcmpSupportValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'VpnEcmpSupportValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpnEcmpSupportValue
      value = pull.read_string
      case value
      when "enable"  then AEC::VpnEcmpSupportValue::Enable
      when "disable" then AEC::VpnEcmpSupportValue::Disable
      else
        raise Exception.new("unknown enum value for 'VpnEcmpSupportValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpnEcmpSupportValue::Enable  then "enable"
      when AEC::VpnEcmpSupportValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'VpnEcmpSupportValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpnEcmpSupportValue?
      case key
      when "enable"  then AEC::VpnEcmpSupportValue::Enable
      when "disable" then AEC::VpnEcmpSupportValue::Disable
      else
        nil
      end
    end
  end
end
