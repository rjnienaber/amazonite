private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FleetEventType
    InstanceChange
    FleetChange
    ServiceError

    def self.to_json(e : FleetEventType, json : JSON::Builder) : Nil
      value = case e
              when AEC::FleetEventType::InstanceChange then "instance-change"
              when AEC::FleetEventType::FleetChange    then "fleet-change"
              when AEC::FleetEventType::ServiceError   then "service-error"
              else
                raise Exception.new("unknown enum value for 'FleetEventType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FleetEventType
      value = pull.read_string
      case value
      when "instance-change" then AEC::FleetEventType::InstanceChange
      when "fleet-change"    then AEC::FleetEventType::FleetChange
      when "service-error"   then AEC::FleetEventType::ServiceError
      else
        raise Exception.new("unknown enum value for 'FleetEventType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FleetEventType::InstanceChange then "instance-change"
      when AEC::FleetEventType::FleetChange    then "fleet-change"
      when AEC::FleetEventType::ServiceError   then "service-error"
      else
        raise Exception.new("unknown enum value for 'FleetEventType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FleetEventType?
      case key
      when "instance-change" then AEC::FleetEventType::InstanceChange
      when "fleet-change"    then AEC::FleetEventType::FleetChange
      when "service-error"   then AEC::FleetEventType::ServiceError
      else
        nil
      end
    end
  end
end
