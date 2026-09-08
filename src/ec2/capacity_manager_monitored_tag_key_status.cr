private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityManagerMonitoredTagKeyStatus
    Activating
    Activated
    Deactivating
    Suspended

    def self.to_json(e : CapacityManagerMonitoredTagKeyStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityManagerMonitoredTagKeyStatus::Activating   then "activating"
              when AEC::CapacityManagerMonitoredTagKeyStatus::Activated    then "activated"
              when AEC::CapacityManagerMonitoredTagKeyStatus::Deactivating then "deactivating"
              when AEC::CapacityManagerMonitoredTagKeyStatus::Suspended    then "suspended"
              else
                raise Exception.new("unknown enum value for 'CapacityManagerMonitoredTagKeyStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityManagerMonitoredTagKeyStatus
      value = pull.read_string
      case value
      when "activating"   then AEC::CapacityManagerMonitoredTagKeyStatus::Activating
      when "activated"    then AEC::CapacityManagerMonitoredTagKeyStatus::Activated
      when "deactivating" then AEC::CapacityManagerMonitoredTagKeyStatus::Deactivating
      when "suspended"    then AEC::CapacityManagerMonitoredTagKeyStatus::Suspended
      else
        raise Exception.new("unknown enum value for 'CapacityManagerMonitoredTagKeyStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityManagerMonitoredTagKeyStatus::Activating   then "activating"
      when AEC::CapacityManagerMonitoredTagKeyStatus::Activated    then "activated"
      when AEC::CapacityManagerMonitoredTagKeyStatus::Deactivating then "deactivating"
      when AEC::CapacityManagerMonitoredTagKeyStatus::Suspended    then "suspended"
      else
        raise Exception.new("unknown enum value for 'CapacityManagerMonitoredTagKeyStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityManagerMonitoredTagKeyStatus?
      case key
      when "activating"   then AEC::CapacityManagerMonitoredTagKeyStatus::Activating
      when "activated"    then AEC::CapacityManagerMonitoredTagKeyStatus::Activated
      when "deactivating" then AEC::CapacityManagerMonitoredTagKeyStatus::Deactivating
      when "suspended"    then AEC::CapacityManagerMonitoredTagKeyStatus::Suspended
      else
        nil
      end
    end
  end
end
