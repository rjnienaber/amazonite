private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityReservationLaunchStatus
    Launchable
    Unlaunchable

    def self.to_json(e : CapacityReservationLaunchStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityReservationLaunchStatus::Launchable   then "launchable"
              when AEC::CapacityReservationLaunchStatus::Unlaunchable then "unlaunchable"
              else
                raise Exception.new("unknown enum value for 'CapacityReservationLaunchStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityReservationLaunchStatus
      value = pull.read_string
      case value
      when "launchable"   then AEC::CapacityReservationLaunchStatus::Launchable
      when "unlaunchable" then AEC::CapacityReservationLaunchStatus::Unlaunchable
      else
        raise Exception.new("unknown enum value for 'CapacityReservationLaunchStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityReservationLaunchStatus::Launchable   then "launchable"
      when AEC::CapacityReservationLaunchStatus::Unlaunchable then "unlaunchable"
      else
        raise Exception.new("unknown enum value for 'CapacityReservationLaunchStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityReservationLaunchStatus?
      case key
      when "launchable"   then AEC::CapacityReservationLaunchStatus::Launchable
      when "unlaunchable" then AEC::CapacityReservationLaunchStatus::Unlaunchable
      else
        nil
      end
    end
  end
end
