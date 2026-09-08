private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum EncryptionSupportOptionValue
    Enable
    Disable

    def self.to_json(e : EncryptionSupportOptionValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::EncryptionSupportOptionValue::Enable  then "enable"
              when AEC::EncryptionSupportOptionValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'EncryptionSupportOptionValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::EncryptionSupportOptionValue
      value = pull.read_string
      case value
      when "enable"  then AEC::EncryptionSupportOptionValue::Enable
      when "disable" then AEC::EncryptionSupportOptionValue::Disable
      else
        raise Exception.new("unknown enum value for 'EncryptionSupportOptionValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::EncryptionSupportOptionValue::Enable  then "enable"
      when AEC::EncryptionSupportOptionValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'EncryptionSupportOptionValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::EncryptionSupportOptionValue?
      case key
      when "enable"  then AEC::EncryptionSupportOptionValue::Enable
      when "disable" then AEC::EncryptionSupportOptionValue::Disable
      else
        nil
      end
    end
  end
end
