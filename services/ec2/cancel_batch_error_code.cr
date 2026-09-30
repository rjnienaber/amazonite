private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CancelBatchErrorCode
    FleetRequestIdDoesNotExist
    FleetRequestIdMalformed
    FleetRequestNotInCancellableState
    UnexpectedError

    def self.to_json(e : CancelBatchErrorCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::CancelBatchErrorCode::FleetRequestIdDoesNotExist        then "fleetRequestIdDoesNotExist"
              when AEC::CancelBatchErrorCode::FleetRequestIdMalformed           then "fleetRequestIdMalformed"
              when AEC::CancelBatchErrorCode::FleetRequestNotInCancellableState then "fleetRequestNotInCancellableState"
              when AEC::CancelBatchErrorCode::UnexpectedError                   then "unexpectedError"
              else
                raise Exception.new("unknown enum value for 'CancelBatchErrorCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CancelBatchErrorCode
      value = pull.read_string
      case value
      when "fleetRequestIdDoesNotExist"        then AEC::CancelBatchErrorCode::FleetRequestIdDoesNotExist
      when "fleetRequestIdMalformed"           then AEC::CancelBatchErrorCode::FleetRequestIdMalformed
      when "fleetRequestNotInCancellableState" then AEC::CancelBatchErrorCode::FleetRequestNotInCancellableState
      when "unexpectedError"                   then AEC::CancelBatchErrorCode::UnexpectedError
      else
        raise Exception.new("unknown enum value for 'CancelBatchErrorCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CancelBatchErrorCode::FleetRequestIdDoesNotExist        then "fleetRequestIdDoesNotExist"
      when AEC::CancelBatchErrorCode::FleetRequestIdMalformed           then "fleetRequestIdMalformed"
      when AEC::CancelBatchErrorCode::FleetRequestNotInCancellableState then "fleetRequestNotInCancellableState"
      when AEC::CancelBatchErrorCode::UnexpectedError                   then "unexpectedError"
      else
        raise Exception.new("unknown enum value for 'CancelBatchErrorCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CancelBatchErrorCode?
      case key
      when "fleetRequestIdDoesNotExist"        then AEC::CancelBatchErrorCode::FleetRequestIdDoesNotExist
      when "fleetRequestIdMalformed"           then AEC::CancelBatchErrorCode::FleetRequestIdMalformed
      when "fleetRequestNotInCancellableState" then AEC::CancelBatchErrorCode::FleetRequestNotInCancellableState
      when "unexpectedError"                   then AEC::CancelBatchErrorCode::UnexpectedError
      else
        nil
      end
    end
  end
end
