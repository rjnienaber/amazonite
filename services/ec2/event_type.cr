private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum EventType
    InstanceChange
    FleetRequestChange
    Error
    Information

    def self.to_json(e : EventType, json : JSON::Builder) : Nil
      value = case e
              when AEC::EventType::InstanceChange     then "instanceChange"
              when AEC::EventType::FleetRequestChange then "fleetRequestChange"
              when AEC::EventType::Error              then "error"
              when AEC::EventType::Information        then "information"
              else
                raise Exception.new("unknown enum value for 'EventType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::EventType
      value = pull.read_string
      case value
      when "instanceChange"     then AEC::EventType::InstanceChange
      when "fleetRequestChange" then AEC::EventType::FleetRequestChange
      when "error"              then AEC::EventType::Error
      when "information"        then AEC::EventType::Information
      else
        raise Exception.new("unknown enum value for 'EventType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::EventType::InstanceChange     then "instanceChange"
      when AEC::EventType::FleetRequestChange then "fleetRequestChange"
      when AEC::EventType::Error              then "error"
      when AEC::EventType::Information        then "information"
      else
        raise Exception.new("unknown enum value for 'EventType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::EventType?
      case key
      when "instanceChange"     then AEC::EventType::InstanceChange
      when "fleetRequestChange" then AEC::EventType::FleetRequestChange
      when "error"              then AEC::EventType::Error
      when "information"        then AEC::EventType::Information
      else
        nil
      end
    end
  end
end
