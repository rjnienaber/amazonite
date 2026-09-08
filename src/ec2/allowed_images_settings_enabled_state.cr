private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AllowedImagesSettingsEnabledState
    Enabled
    AuditMode

    def self.to_json(e : AllowedImagesSettingsEnabledState, json : JSON::Builder) : Nil
      value = case e
              when AEC::AllowedImagesSettingsEnabledState::Enabled   then "enabled"
              when AEC::AllowedImagesSettingsEnabledState::AuditMode then "audit-mode"
              else
                raise Exception.new("unknown enum value for 'AllowedImagesSettingsEnabledState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AllowedImagesSettingsEnabledState
      value = pull.read_string
      case value
      when "enabled"    then AEC::AllowedImagesSettingsEnabledState::Enabled
      when "audit-mode" then AEC::AllowedImagesSettingsEnabledState::AuditMode
      else
        raise Exception.new("unknown enum value for 'AllowedImagesSettingsEnabledState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AllowedImagesSettingsEnabledState::Enabled   then "enabled"
      when AEC::AllowedImagesSettingsEnabledState::AuditMode then "audit-mode"
      else
        raise Exception.new("unknown enum value for 'AllowedImagesSettingsEnabledState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AllowedImagesSettingsEnabledState?
      case key
      when "enabled"    then AEC::AllowedImagesSettingsEnabledState::Enabled
      when "audit-mode" then AEC::AllowedImagesSettingsEnabledState::AuditMode
      else
        nil
      end
    end
  end
end
