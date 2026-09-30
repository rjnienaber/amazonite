private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DeleteQueuedReservedInstancesErrorCode
    ReservedInstancesIdInvalid
    ReservedInstancesNotInQueuedState
    UnexpectedError

    def self.to_json(e : DeleteQueuedReservedInstancesErrorCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::DeleteQueuedReservedInstancesErrorCode::ReservedInstancesIdInvalid        then "reserved-instances-id-invalid"
              when AEC::DeleteQueuedReservedInstancesErrorCode::ReservedInstancesNotInQueuedState then "reserved-instances-not-in-queued-state"
              when AEC::DeleteQueuedReservedInstancesErrorCode::UnexpectedError                   then "unexpected-error"
              else
                raise Exception.new("unknown enum value for 'DeleteQueuedReservedInstancesErrorCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DeleteQueuedReservedInstancesErrorCode
      value = pull.read_string
      case value
      when "reserved-instances-id-invalid"          then AEC::DeleteQueuedReservedInstancesErrorCode::ReservedInstancesIdInvalid
      when "reserved-instances-not-in-queued-state" then AEC::DeleteQueuedReservedInstancesErrorCode::ReservedInstancesNotInQueuedState
      when "unexpected-error"                       then AEC::DeleteQueuedReservedInstancesErrorCode::UnexpectedError
      else
        raise Exception.new("unknown enum value for 'DeleteQueuedReservedInstancesErrorCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DeleteQueuedReservedInstancesErrorCode::ReservedInstancesIdInvalid        then "reserved-instances-id-invalid"
      when AEC::DeleteQueuedReservedInstancesErrorCode::ReservedInstancesNotInQueuedState then "reserved-instances-not-in-queued-state"
      when AEC::DeleteQueuedReservedInstancesErrorCode::UnexpectedError                   then "unexpected-error"
      else
        raise Exception.new("unknown enum value for 'DeleteQueuedReservedInstancesErrorCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DeleteQueuedReservedInstancesErrorCode?
      case key
      when "reserved-instances-id-invalid"          then AEC::DeleteQueuedReservedInstancesErrorCode::ReservedInstancesIdInvalid
      when "reserved-instances-not-in-queued-state" then AEC::DeleteQueuedReservedInstancesErrorCode::ReservedInstancesNotInQueuedState
      when "unexpected-error"                       then AEC::DeleteQueuedReservedInstancesErrorCode::UnexpectedError
      else
        nil
      end
    end
  end
end
