private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityReservationState
    Active
    Expired
    Cancelled
    Pending
    Failed
    Scheduled
    PaymentPending
    PaymentFailed
    Assessing
    Delayed
    Unsupported
    Cancelling
    Unavailable

    def self.to_json(e : CapacityReservationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityReservationState::Active         then "active"
              when AEC::CapacityReservationState::Expired        then "expired"
              when AEC::CapacityReservationState::Cancelled      then "cancelled"
              when AEC::CapacityReservationState::Pending        then "pending"
              when AEC::CapacityReservationState::Failed         then "failed"
              when AEC::CapacityReservationState::Scheduled      then "scheduled"
              when AEC::CapacityReservationState::PaymentPending then "payment-pending"
              when AEC::CapacityReservationState::PaymentFailed  then "payment-failed"
              when AEC::CapacityReservationState::Assessing      then "assessing"
              when AEC::CapacityReservationState::Delayed        then "delayed"
              when AEC::CapacityReservationState::Unsupported    then "unsupported"
              when AEC::CapacityReservationState::Cancelling     then "cancelling"
              when AEC::CapacityReservationState::Unavailable    then "unavailable"
              else
                raise Exception.new("unknown enum value for 'CapacityReservationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityReservationState
      value = pull.read_string
      case value
      when "active"          then AEC::CapacityReservationState::Active
      when "expired"         then AEC::CapacityReservationState::Expired
      when "cancelled"       then AEC::CapacityReservationState::Cancelled
      when "pending"         then AEC::CapacityReservationState::Pending
      when "failed"          then AEC::CapacityReservationState::Failed
      when "scheduled"       then AEC::CapacityReservationState::Scheduled
      when "payment-pending" then AEC::CapacityReservationState::PaymentPending
      when "payment-failed"  then AEC::CapacityReservationState::PaymentFailed
      when "assessing"       then AEC::CapacityReservationState::Assessing
      when "delayed"         then AEC::CapacityReservationState::Delayed
      when "unsupported"     then AEC::CapacityReservationState::Unsupported
      when "cancelling"      then AEC::CapacityReservationState::Cancelling
      when "unavailable"     then AEC::CapacityReservationState::Unavailable
      else
        raise Exception.new("unknown enum value for 'CapacityReservationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityReservationState::Active         then "active"
      when AEC::CapacityReservationState::Expired        then "expired"
      when AEC::CapacityReservationState::Cancelled      then "cancelled"
      when AEC::CapacityReservationState::Pending        then "pending"
      when AEC::CapacityReservationState::Failed         then "failed"
      when AEC::CapacityReservationState::Scheduled      then "scheduled"
      when AEC::CapacityReservationState::PaymentPending then "payment-pending"
      when AEC::CapacityReservationState::PaymentFailed  then "payment-failed"
      when AEC::CapacityReservationState::Assessing      then "assessing"
      when AEC::CapacityReservationState::Delayed        then "delayed"
      when AEC::CapacityReservationState::Unsupported    then "unsupported"
      when AEC::CapacityReservationState::Cancelling     then "cancelling"
      when AEC::CapacityReservationState::Unavailable    then "unavailable"
      else
        raise Exception.new("unknown enum value for 'CapacityReservationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityReservationState?
      case key
      when "active"          then AEC::CapacityReservationState::Active
      when "expired"         then AEC::CapacityReservationState::Expired
      when "cancelled"       then AEC::CapacityReservationState::Cancelled
      when "pending"         then AEC::CapacityReservationState::Pending
      when "failed"          then AEC::CapacityReservationState::Failed
      when "scheduled"       then AEC::CapacityReservationState::Scheduled
      when "payment-pending" then AEC::CapacityReservationState::PaymentPending
      when "payment-failed"  then AEC::CapacityReservationState::PaymentFailed
      when "assessing"       then AEC::CapacityReservationState::Assessing
      when "delayed"         then AEC::CapacityReservationState::Delayed
      when "unsupported"     then AEC::CapacityReservationState::Unsupported
      when "cancelling"      then AEC::CapacityReservationState::Cancelling
      when "unavailable"     then AEC::CapacityReservationState::Unavailable
      else
        nil
      end
    end
  end
end
