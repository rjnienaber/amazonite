private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceRebootMigrationState
    Disabled
    Default

    def self.to_json(e : InstanceRebootMigrationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceRebootMigrationState::Disabled then "disabled"
              when AEC::InstanceRebootMigrationState::Default  then "default"
              else
                raise Exception.new("unknown enum value for 'InstanceRebootMigrationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceRebootMigrationState
      value = pull.read_string
      case value
      when "disabled" then AEC::InstanceRebootMigrationState::Disabled
      when "default"  then AEC::InstanceRebootMigrationState::Default
      else
        raise Exception.new("unknown enum value for 'InstanceRebootMigrationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceRebootMigrationState::Disabled then "disabled"
      when AEC::InstanceRebootMigrationState::Default  then "default"
      else
        raise Exception.new("unknown enum value for 'InstanceRebootMigrationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceRebootMigrationState?
      case key
      when "disabled" then AEC::InstanceRebootMigrationState::Disabled
      when "default"  then AEC::InstanceRebootMigrationState::Default
      else
        nil
      end
    end
  end
end
