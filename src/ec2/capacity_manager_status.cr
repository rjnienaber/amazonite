private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityManagerStatus
    Enabled
    Disabled

    def self.to_json(e : CapacityManagerStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityManagerStatus::Enabled  then "enabled"
              when AEC::CapacityManagerStatus::Disabled then "disabled"
              else
                raise Exception.new("unknown enum value for 'CapacityManagerStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityManagerStatus
      value = pull.read_string
      case value
      when "enabled"  then AEC::CapacityManagerStatus::Enabled
      when "disabled" then AEC::CapacityManagerStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'CapacityManagerStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityManagerStatus::Enabled  then "enabled"
      when AEC::CapacityManagerStatus::Disabled then "disabled"
      else
        raise Exception.new("unknown enum value for 'CapacityManagerStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityManagerStatus?
      case key
      when "enabled"  then AEC::CapacityManagerStatus::Enabled
      when "disabled" then AEC::CapacityManagerStatus::Disabled
      else
        nil
      end
    end
  end
end
