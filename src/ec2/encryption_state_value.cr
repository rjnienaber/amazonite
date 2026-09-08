private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum EncryptionStateValue
    Enabling
    Enabled
    Disabling
    Disabled

    def self.to_json(e : EncryptionStateValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::EncryptionStateValue::Enabling  then "enabling"
              when AEC::EncryptionStateValue::Enabled   then "enabled"
              when AEC::EncryptionStateValue::Disabling then "disabling"
              when AEC::EncryptionStateValue::Disabled  then "disabled"
              else
                raise Exception.new("unknown enum value for 'EncryptionStateValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::EncryptionStateValue
      value = pull.read_string
      case value
      when "enabling"  then AEC::EncryptionStateValue::Enabling
      when "enabled"   then AEC::EncryptionStateValue::Enabled
      when "disabling" then AEC::EncryptionStateValue::Disabling
      when "disabled"  then AEC::EncryptionStateValue::Disabled
      else
        raise Exception.new("unknown enum value for 'EncryptionStateValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::EncryptionStateValue::Enabling  then "enabling"
      when AEC::EncryptionStateValue::Enabled   then "enabled"
      when AEC::EncryptionStateValue::Disabling then "disabling"
      when AEC::EncryptionStateValue::Disabled  then "disabled"
      else
        raise Exception.new("unknown enum value for 'EncryptionStateValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::EncryptionStateValue?
      case key
      when "enabling"  then AEC::EncryptionStateValue::Enabling
      when "enabled"   then AEC::EncryptionStateValue::Enabled
      when "disabling" then AEC::EncryptionStateValue::Disabling
      when "disabled"  then AEC::EncryptionStateValue::Disabled
      else
        nil
      end
    end
  end
end
