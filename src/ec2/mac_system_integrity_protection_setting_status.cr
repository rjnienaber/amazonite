private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum MacSystemIntegrityProtectionSettingStatus
    Enabled
    Disabled

    def self.to_json(e : MacSystemIntegrityProtectionSettingStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::MacSystemIntegrityProtectionSettingStatus::Enabled  then "enabled"
              when AEC::MacSystemIntegrityProtectionSettingStatus::Disabled then "disabled"
              else
                raise Exception.new("unknown enum value for 'MacSystemIntegrityProtectionSettingStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::MacSystemIntegrityProtectionSettingStatus
      value = pull.read_string
      case value
      when "enabled"  then AEC::MacSystemIntegrityProtectionSettingStatus::Enabled
      when "disabled" then AEC::MacSystemIntegrityProtectionSettingStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'MacSystemIntegrityProtectionSettingStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::MacSystemIntegrityProtectionSettingStatus::Enabled  then "enabled"
      when AEC::MacSystemIntegrityProtectionSettingStatus::Disabled then "disabled"
      else
        raise Exception.new("unknown enum value for 'MacSystemIntegrityProtectionSettingStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::MacSystemIntegrityProtectionSettingStatus?
      case key
      when "enabled"  then AEC::MacSystemIntegrityProtectionSettingStatus::Enabled
      when "disabled" then AEC::MacSystemIntegrityProtectionSettingStatus::Disabled
      else
        nil
      end
    end
  end
end
