private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum GlobalTableSettingsReplicationMode
    Enabled
    Disabled
    EnabledWithOverrides

    def self.to_json(e : GlobalTableSettingsReplicationMode, json : JSON::Builder) : Nil
      value = case e
              when ADDB::GlobalTableSettingsReplicationMode::Enabled              then "ENABLED"
              when ADDB::GlobalTableSettingsReplicationMode::Disabled             then "DISABLED"
              when ADDB::GlobalTableSettingsReplicationMode::EnabledWithOverrides then "ENABLED_WITH_OVERRIDES"
              else
                raise Exception.new("unknown enum value for 'GlobalTableSettingsReplicationMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::GlobalTableSettingsReplicationMode
      value = pull.read_string
      case value
      when "ENABLED"                then ADDB::GlobalTableSettingsReplicationMode::Enabled
      when "DISABLED"               then ADDB::GlobalTableSettingsReplicationMode::Disabled
      when "ENABLED_WITH_OVERRIDES" then ADDB::GlobalTableSettingsReplicationMode::EnabledWithOverrides
      else
        raise Exception.new("unknown enum value for 'GlobalTableSettingsReplicationMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::GlobalTableSettingsReplicationMode::Enabled              then "ENABLED"
      when ADDB::GlobalTableSettingsReplicationMode::Disabled             then "DISABLED"
      when ADDB::GlobalTableSettingsReplicationMode::EnabledWithOverrides then "ENABLED_WITH_OVERRIDES"
      else
        raise Exception.new("unknown enum value for 'GlobalTableSettingsReplicationMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::GlobalTableSettingsReplicationMode?
      case key
      when "ENABLED"                then ADDB::GlobalTableSettingsReplicationMode::Enabled
      when "DISABLED"               then ADDB::GlobalTableSettingsReplicationMode::Disabled
      when "ENABLED_WITH_OVERRIDES" then ADDB::GlobalTableSettingsReplicationMode::EnabledWithOverrides
      else
        nil
      end
    end
  end
end
