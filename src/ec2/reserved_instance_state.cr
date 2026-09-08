private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ReservedInstanceState
    PaymentPending
    Active
    PaymentFailed
    Retired
    Queued
    QueuedDeleted

    def self.to_json(e : ReservedInstanceState, json : JSON::Builder) : Nil
      value = case e
              when AEC::ReservedInstanceState::PaymentPending then "payment-pending"
              when AEC::ReservedInstanceState::Active         then "active"
              when AEC::ReservedInstanceState::PaymentFailed  then "payment-failed"
              when AEC::ReservedInstanceState::Retired        then "retired"
              when AEC::ReservedInstanceState::Queued         then "queued"
              when AEC::ReservedInstanceState::QueuedDeleted  then "queued-deleted"
              else
                raise Exception.new("unknown enum value for 'ReservedInstanceState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ReservedInstanceState
      value = pull.read_string
      case value
      when "payment-pending" then AEC::ReservedInstanceState::PaymentPending
      when "active"          then AEC::ReservedInstanceState::Active
      when "payment-failed"  then AEC::ReservedInstanceState::PaymentFailed
      when "retired"         then AEC::ReservedInstanceState::Retired
      when "queued"          then AEC::ReservedInstanceState::Queued
      when "queued-deleted"  then AEC::ReservedInstanceState::QueuedDeleted
      else
        raise Exception.new("unknown enum value for 'ReservedInstanceState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ReservedInstanceState::PaymentPending then "payment-pending"
      when AEC::ReservedInstanceState::Active         then "active"
      when AEC::ReservedInstanceState::PaymentFailed  then "payment-failed"
      when AEC::ReservedInstanceState::Retired        then "retired"
      when AEC::ReservedInstanceState::Queued         then "queued"
      when AEC::ReservedInstanceState::QueuedDeleted  then "queued-deleted"
      else
        raise Exception.new("unknown enum value for 'ReservedInstanceState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ReservedInstanceState?
      case key
      when "payment-pending" then AEC::ReservedInstanceState::PaymentPending
      when "active"          then AEC::ReservedInstanceState::Active
      when "payment-failed"  then AEC::ReservedInstanceState::PaymentFailed
      when "retired"         then AEC::ReservedInstanceState::Retired
      when "queued"          then AEC::ReservedInstanceState::Queued
      when "queued-deleted"  then AEC::ReservedInstanceState::QueuedDeleted
      else
        nil
      end
    end
  end
end
