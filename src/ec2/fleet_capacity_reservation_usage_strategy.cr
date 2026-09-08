private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FleetCapacityReservationUsageStrategy
    UseCapacityReservationsFirst

    def self.to_json(e : FleetCapacityReservationUsageStrategy, json : JSON::Builder) : Nil
      value = case e
              when AEC::FleetCapacityReservationUsageStrategy::UseCapacityReservationsFirst then "use-capacity-reservations-first"
              else
                raise Exception.new("unknown enum value for 'FleetCapacityReservationUsageStrategy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FleetCapacityReservationUsageStrategy
      value = pull.read_string
      case value
      when "use-capacity-reservations-first" then AEC::FleetCapacityReservationUsageStrategy::UseCapacityReservationsFirst
      else
        raise Exception.new("unknown enum value for 'FleetCapacityReservationUsageStrategy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FleetCapacityReservationUsageStrategy::UseCapacityReservationsFirst then "use-capacity-reservations-first"
      else
        raise Exception.new("unknown enum value for 'FleetCapacityReservationUsageStrategy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FleetCapacityReservationUsageStrategy?
      case key
      when "use-capacity-reservations-first" then AEC::FleetCapacityReservationUsageStrategy::UseCapacityReservationsFirst
      else
        nil
      end
    end
  end
end
