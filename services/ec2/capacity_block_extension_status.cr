private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityBlockExtensionStatus
    PaymentPending
    PaymentFailed
    PaymentSucceeded

    def self.to_json(e : CapacityBlockExtensionStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityBlockExtensionStatus::PaymentPending   then "payment-pending"
              when AEC::CapacityBlockExtensionStatus::PaymentFailed    then "payment-failed"
              when AEC::CapacityBlockExtensionStatus::PaymentSucceeded then "payment-succeeded"
              else
                raise Exception.new("unknown enum value for 'CapacityBlockExtensionStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityBlockExtensionStatus
      value = pull.read_string
      case value
      when "payment-pending"   then AEC::CapacityBlockExtensionStatus::PaymentPending
      when "payment-failed"    then AEC::CapacityBlockExtensionStatus::PaymentFailed
      when "payment-succeeded" then AEC::CapacityBlockExtensionStatus::PaymentSucceeded
      else
        raise Exception.new("unknown enum value for 'CapacityBlockExtensionStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityBlockExtensionStatus::PaymentPending   then "payment-pending"
      when AEC::CapacityBlockExtensionStatus::PaymentFailed    then "payment-failed"
      when AEC::CapacityBlockExtensionStatus::PaymentSucceeded then "payment-succeeded"
      else
        raise Exception.new("unknown enum value for 'CapacityBlockExtensionStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityBlockExtensionStatus?
      case key
      when "payment-pending"   then AEC::CapacityBlockExtensionStatus::PaymentPending
      when "payment-failed"    then AEC::CapacityBlockExtensionStatus::PaymentFailed
      when "payment-succeeded" then AEC::CapacityBlockExtensionStatus::PaymentSucceeded
      else
        nil
      end
    end
  end
end
