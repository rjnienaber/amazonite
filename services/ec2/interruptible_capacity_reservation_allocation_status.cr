private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InterruptibleCapacityReservationAllocationStatus
    Pending
    Active
    Updating
    Canceling
    Canceled
    Failed

    def self.to_json(e : InterruptibleCapacityReservationAllocationStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::InterruptibleCapacityReservationAllocationStatus::Pending   then "pending"
              when AEC::InterruptibleCapacityReservationAllocationStatus::Active    then "active"
              when AEC::InterruptibleCapacityReservationAllocationStatus::Updating  then "updating"
              when AEC::InterruptibleCapacityReservationAllocationStatus::Canceling then "canceling"
              when AEC::InterruptibleCapacityReservationAllocationStatus::Canceled  then "canceled"
              when AEC::InterruptibleCapacityReservationAllocationStatus::Failed    then "failed"
              else
                raise Exception.new("unknown enum value for 'InterruptibleCapacityReservationAllocationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InterruptibleCapacityReservationAllocationStatus
      value = pull.read_string
      case value
      when "pending"   then AEC::InterruptibleCapacityReservationAllocationStatus::Pending
      when "active"    then AEC::InterruptibleCapacityReservationAllocationStatus::Active
      when "updating"  then AEC::InterruptibleCapacityReservationAllocationStatus::Updating
      when "canceling" then AEC::InterruptibleCapacityReservationAllocationStatus::Canceling
      when "canceled"  then AEC::InterruptibleCapacityReservationAllocationStatus::Canceled
      when "failed"    then AEC::InterruptibleCapacityReservationAllocationStatus::Failed
      else
        raise Exception.new("unknown enum value for 'InterruptibleCapacityReservationAllocationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InterruptibleCapacityReservationAllocationStatus::Pending   then "pending"
      when AEC::InterruptibleCapacityReservationAllocationStatus::Active    then "active"
      when AEC::InterruptibleCapacityReservationAllocationStatus::Updating  then "updating"
      when AEC::InterruptibleCapacityReservationAllocationStatus::Canceling then "canceling"
      when AEC::InterruptibleCapacityReservationAllocationStatus::Canceled  then "canceled"
      when AEC::InterruptibleCapacityReservationAllocationStatus::Failed    then "failed"
      else
        raise Exception.new("unknown enum value for 'InterruptibleCapacityReservationAllocationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InterruptibleCapacityReservationAllocationStatus?
      case key
      when "pending"   then AEC::InterruptibleCapacityReservationAllocationStatus::Pending
      when "active"    then AEC::InterruptibleCapacityReservationAllocationStatus::Active
      when "updating"  then AEC::InterruptibleCapacityReservationAllocationStatus::Updating
      when "canceling" then AEC::InterruptibleCapacityReservationAllocationStatus::Canceling
      when "canceled"  then AEC::InterruptibleCapacityReservationAllocationStatus::Canceled
      when "failed"    then AEC::InterruptibleCapacityReservationAllocationStatus::Failed
      else
        nil
      end
    end
  end
end
