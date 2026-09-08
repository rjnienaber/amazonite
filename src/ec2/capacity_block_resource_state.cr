private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityBlockResourceState
    Active
    Expired
    Unavailable
    Cancelled
    Failed
    Scheduled
    PaymentPending
    PaymentFailed

    def self.to_json(e : CapacityBlockResourceState, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityBlockResourceState::Active         then "active"
              when AEC::CapacityBlockResourceState::Expired        then "expired"
              when AEC::CapacityBlockResourceState::Unavailable    then "unavailable"
              when AEC::CapacityBlockResourceState::Cancelled      then "cancelled"
              when AEC::CapacityBlockResourceState::Failed         then "failed"
              when AEC::CapacityBlockResourceState::Scheduled      then "scheduled"
              when AEC::CapacityBlockResourceState::PaymentPending then "payment-pending"
              when AEC::CapacityBlockResourceState::PaymentFailed  then "payment-failed"
              else
                raise Exception.new("unknown enum value for 'CapacityBlockResourceState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityBlockResourceState
      value = pull.read_string
      case value
      when "active"          then AEC::CapacityBlockResourceState::Active
      when "expired"         then AEC::CapacityBlockResourceState::Expired
      when "unavailable"     then AEC::CapacityBlockResourceState::Unavailable
      when "cancelled"       then AEC::CapacityBlockResourceState::Cancelled
      when "failed"          then AEC::CapacityBlockResourceState::Failed
      when "scheduled"       then AEC::CapacityBlockResourceState::Scheduled
      when "payment-pending" then AEC::CapacityBlockResourceState::PaymentPending
      when "payment-failed"  then AEC::CapacityBlockResourceState::PaymentFailed
      else
        raise Exception.new("unknown enum value for 'CapacityBlockResourceState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityBlockResourceState::Active         then "active"
      when AEC::CapacityBlockResourceState::Expired        then "expired"
      when AEC::CapacityBlockResourceState::Unavailable    then "unavailable"
      when AEC::CapacityBlockResourceState::Cancelled      then "cancelled"
      when AEC::CapacityBlockResourceState::Failed         then "failed"
      when AEC::CapacityBlockResourceState::Scheduled      then "scheduled"
      when AEC::CapacityBlockResourceState::PaymentPending then "payment-pending"
      when AEC::CapacityBlockResourceState::PaymentFailed  then "payment-failed"
      else
        raise Exception.new("unknown enum value for 'CapacityBlockResourceState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityBlockResourceState?
      case key
      when "active"          then AEC::CapacityBlockResourceState::Active
      when "expired"         then AEC::CapacityBlockResourceState::Expired
      when "unavailable"     then AEC::CapacityBlockResourceState::Unavailable
      when "cancelled"       then AEC::CapacityBlockResourceState::Cancelled
      when "failed"          then AEC::CapacityBlockResourceState::Failed
      when "scheduled"       then AEC::CapacityBlockResourceState::Scheduled
      when "payment-pending" then AEC::CapacityBlockResourceState::PaymentPending
      when "payment-failed"  then AEC::CapacityBlockResourceState::PaymentFailed
      else
        nil
      end
    end
  end
end
