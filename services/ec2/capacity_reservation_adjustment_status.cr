private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityReservationAdjustmentStatus
    Requested
    Applied
    Rejected

    def self.to_json(e : CapacityReservationAdjustmentStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityReservationAdjustmentStatus::Requested then "requested"
              when AEC::CapacityReservationAdjustmentStatus::Applied   then "applied"
              when AEC::CapacityReservationAdjustmentStatus::Rejected  then "rejected"
              else
                raise Exception.new("unknown enum value for 'CapacityReservationAdjustmentStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityReservationAdjustmentStatus
      value = pull.read_string
      case value
      when "requested" then AEC::CapacityReservationAdjustmentStatus::Requested
      when "applied"   then AEC::CapacityReservationAdjustmentStatus::Applied
      when "rejected"  then AEC::CapacityReservationAdjustmentStatus::Rejected
      else
        raise Exception.new("unknown enum value for 'CapacityReservationAdjustmentStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityReservationAdjustmentStatus::Requested then "requested"
      when AEC::CapacityReservationAdjustmentStatus::Applied   then "applied"
      when AEC::CapacityReservationAdjustmentStatus::Rejected  then "rejected"
      else
        raise Exception.new("unknown enum value for 'CapacityReservationAdjustmentStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityReservationAdjustmentStatus?
      case key
      when "requested" then AEC::CapacityReservationAdjustmentStatus::Requested
      when "applied"   then AEC::CapacityReservationAdjustmentStatus::Applied
      when "rejected"  then AEC::CapacityReservationAdjustmentStatus::Rejected
      else
        nil
      end
    end
  end
end
