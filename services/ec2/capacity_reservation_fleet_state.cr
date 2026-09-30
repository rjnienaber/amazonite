private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityReservationFleetState
    Submitted
    Modifying
    Active
    PartiallyFulfilled
    Expiring
    Expired
    Cancelling
    Cancelled
    Failed

    def self.to_json(e : CapacityReservationFleetState, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityReservationFleetState::Submitted          then "submitted"
              when AEC::CapacityReservationFleetState::Modifying          then "modifying"
              when AEC::CapacityReservationFleetState::Active             then "active"
              when AEC::CapacityReservationFleetState::PartiallyFulfilled then "partially_fulfilled"
              when AEC::CapacityReservationFleetState::Expiring           then "expiring"
              when AEC::CapacityReservationFleetState::Expired            then "expired"
              when AEC::CapacityReservationFleetState::Cancelling         then "cancelling"
              when AEC::CapacityReservationFleetState::Cancelled          then "cancelled"
              when AEC::CapacityReservationFleetState::Failed             then "failed"
              else
                raise Exception.new("unknown enum value for 'CapacityReservationFleetState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityReservationFleetState
      value = pull.read_string
      case value
      when "submitted"           then AEC::CapacityReservationFleetState::Submitted
      when "modifying"           then AEC::CapacityReservationFleetState::Modifying
      when "active"              then AEC::CapacityReservationFleetState::Active
      when "partially_fulfilled" then AEC::CapacityReservationFleetState::PartiallyFulfilled
      when "expiring"            then AEC::CapacityReservationFleetState::Expiring
      when "expired"             then AEC::CapacityReservationFleetState::Expired
      when "cancelling"          then AEC::CapacityReservationFleetState::Cancelling
      when "cancelled"           then AEC::CapacityReservationFleetState::Cancelled
      when "failed"              then AEC::CapacityReservationFleetState::Failed
      else
        raise Exception.new("unknown enum value for 'CapacityReservationFleetState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityReservationFleetState::Submitted          then "submitted"
      when AEC::CapacityReservationFleetState::Modifying          then "modifying"
      when AEC::CapacityReservationFleetState::Active             then "active"
      when AEC::CapacityReservationFleetState::PartiallyFulfilled then "partially_fulfilled"
      when AEC::CapacityReservationFleetState::Expiring           then "expiring"
      when AEC::CapacityReservationFleetState::Expired            then "expired"
      when AEC::CapacityReservationFleetState::Cancelling         then "cancelling"
      when AEC::CapacityReservationFleetState::Cancelled          then "cancelled"
      when AEC::CapacityReservationFleetState::Failed             then "failed"
      else
        raise Exception.new("unknown enum value for 'CapacityReservationFleetState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityReservationFleetState?
      case key
      when "submitted"           then AEC::CapacityReservationFleetState::Submitted
      when "modifying"           then AEC::CapacityReservationFleetState::Modifying
      when "active"              then AEC::CapacityReservationFleetState::Active
      when "partially_fulfilled" then AEC::CapacityReservationFleetState::PartiallyFulfilled
      when "expiring"            then AEC::CapacityReservationFleetState::Expiring
      when "expired"             then AEC::CapacityReservationFleetState::Expired
      when "cancelling"          then AEC::CapacityReservationFleetState::Cancelling
      when "cancelled"           then AEC::CapacityReservationFleetState::Cancelled
      when "failed"              then AEC::CapacityReservationFleetState::Failed
      else
        nil
      end
    end
  end
end
