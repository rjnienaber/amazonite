private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FleetCapacityReservationTenancy
    Default

    def self.to_json(e : FleetCapacityReservationTenancy, json : JSON::Builder) : Nil
      value = case e
              when AEC::FleetCapacityReservationTenancy::Default then "default"
              else
                raise Exception.new("unknown enum value for 'FleetCapacityReservationTenancy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FleetCapacityReservationTenancy
      value = pull.read_string
      case value
      when "default" then AEC::FleetCapacityReservationTenancy::Default
      else
        raise Exception.new("unknown enum value for 'FleetCapacityReservationTenancy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FleetCapacityReservationTenancy::Default then "default"
      else
        raise Exception.new("unknown enum value for 'FleetCapacityReservationTenancy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FleetCapacityReservationTenancy?
      case key
      when "default" then AEC::FleetCapacityReservationTenancy::Default
      else
        nil
      end
    end
  end
end
