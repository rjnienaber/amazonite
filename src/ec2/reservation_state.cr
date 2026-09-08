private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ReservationState
    Active
    Expired
    Cancelled
    Scheduled
    Pending
    Failed
    Delayed
    Unsupported
    PaymentPending
    PaymentFailed
    Retired

    def self.to_json(e : ReservationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::ReservationState::Active         then "active"
              when AEC::ReservationState::Expired        then "expired"
              when AEC::ReservationState::Cancelled      then "cancelled"
              when AEC::ReservationState::Scheduled      then "scheduled"
              when AEC::ReservationState::Pending        then "pending"
              when AEC::ReservationState::Failed         then "failed"
              when AEC::ReservationState::Delayed        then "delayed"
              when AEC::ReservationState::Unsupported    then "unsupported"
              when AEC::ReservationState::PaymentPending then "payment-pending"
              when AEC::ReservationState::PaymentFailed  then "payment-failed"
              when AEC::ReservationState::Retired        then "retired"
              else
                raise Exception.new("unknown enum value for 'ReservationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ReservationState
      value = pull.read_string
      case value
      when "active"          then AEC::ReservationState::Active
      when "expired"         then AEC::ReservationState::Expired
      when "cancelled"       then AEC::ReservationState::Cancelled
      when "scheduled"       then AEC::ReservationState::Scheduled
      when "pending"         then AEC::ReservationState::Pending
      when "failed"          then AEC::ReservationState::Failed
      when "delayed"         then AEC::ReservationState::Delayed
      when "unsupported"     then AEC::ReservationState::Unsupported
      when "payment-pending" then AEC::ReservationState::PaymentPending
      when "payment-failed"  then AEC::ReservationState::PaymentFailed
      when "retired"         then AEC::ReservationState::Retired
      else
        raise Exception.new("unknown enum value for 'ReservationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ReservationState::Active         then "active"
      when AEC::ReservationState::Expired        then "expired"
      when AEC::ReservationState::Cancelled      then "cancelled"
      when AEC::ReservationState::Scheduled      then "scheduled"
      when AEC::ReservationState::Pending        then "pending"
      when AEC::ReservationState::Failed         then "failed"
      when AEC::ReservationState::Delayed        then "delayed"
      when AEC::ReservationState::Unsupported    then "unsupported"
      when AEC::ReservationState::PaymentPending then "payment-pending"
      when AEC::ReservationState::PaymentFailed  then "payment-failed"
      when AEC::ReservationState::Retired        then "retired"
      else
        raise Exception.new("unknown enum value for 'ReservationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ReservationState?
      case key
      when "active"          then AEC::ReservationState::Active
      when "expired"         then AEC::ReservationState::Expired
      when "cancelled"       then AEC::ReservationState::Cancelled
      when "scheduled"       then AEC::ReservationState::Scheduled
      when "pending"         then AEC::ReservationState::Pending
      when "failed"          then AEC::ReservationState::Failed
      when "delayed"         then AEC::ReservationState::Delayed
      when "unsupported"     then AEC::ReservationState::Unsupported
      when "payment-pending" then AEC::ReservationState::PaymentPending
      when "payment-failed"  then AEC::ReservationState::PaymentFailed
      when "retired"         then AEC::ReservationState::Retired
      else
        nil
      end
    end
  end
end
