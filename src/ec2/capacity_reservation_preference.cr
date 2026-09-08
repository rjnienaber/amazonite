private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityReservationPreference
    CapacityReservationsOnly
    Open
    None

    def self.to_json(e : CapacityReservationPreference, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityReservationPreference::CapacityReservationsOnly then "capacity-reservations-only"
              when AEC::CapacityReservationPreference::Open                     then "open"
              when AEC::CapacityReservationPreference::None                     then "none"
              else
                raise Exception.new("unknown enum value for 'CapacityReservationPreference' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityReservationPreference
      value = pull.read_string
      case value
      when "capacity-reservations-only" then AEC::CapacityReservationPreference::CapacityReservationsOnly
      when "open"                       then AEC::CapacityReservationPreference::Open
      when "none"                       then AEC::CapacityReservationPreference::None
      else
        raise Exception.new("unknown enum value for 'CapacityReservationPreference' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityReservationPreference::CapacityReservationsOnly then "capacity-reservations-only"
      when AEC::CapacityReservationPreference::Open                     then "open"
      when AEC::CapacityReservationPreference::None                     then "none"
      else
        raise Exception.new("unknown enum value for 'CapacityReservationPreference' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityReservationPreference?
      case key
      when "capacity-reservations-only" then AEC::CapacityReservationPreference::CapacityReservationsOnly
      when "open"                       then AEC::CapacityReservationPreference::Open
      when "none"                       then AEC::CapacityReservationPreference::None
      else
        nil
      end
    end
  end
end
