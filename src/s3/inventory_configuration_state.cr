private alias AS = Amazonite::S3

module Amazonite::S3
  enum InventoryConfigurationState
    Enabled
    Disabled

    def self.to_json(e : InventoryConfigurationState, json : JSON::Builder) : Nil
      value = case e
              when AS::InventoryConfigurationState::Enabled  then "ENABLED"
              when AS::InventoryConfigurationState::Disabled then "DISABLED"
              else
                raise Exception.new("unknown enum value for 'InventoryConfigurationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::InventoryConfigurationState
      value = pull.read_string
      case value
      when "ENABLED"  then AS::InventoryConfigurationState::Enabled
      when "DISABLED" then AS::InventoryConfigurationState::Disabled
      else
        raise Exception.new("unknown enum value for 'InventoryConfigurationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::InventoryConfigurationState::Enabled  then "ENABLED"
      when AS::InventoryConfigurationState::Disabled then "DISABLED"
      else
        raise Exception.new("unknown enum value for 'InventoryConfigurationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::InventoryConfigurationState?
      case key
      when "ENABLED"  then AS::InventoryConfigurationState::Enabled
      when "DISABLED" then AS::InventoryConfigurationState::Disabled
      else
        nil
      end
    end
  end
end
