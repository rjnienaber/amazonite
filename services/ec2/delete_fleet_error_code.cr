private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DeleteFleetErrorCode
    FleetIdDoesNotExist
    FleetIdMalformed
    FleetNotInDeletableState
    UnexpectedError

    def self.to_json(e : DeleteFleetErrorCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::DeleteFleetErrorCode::FleetIdDoesNotExist      then "fleetIdDoesNotExist"
              when AEC::DeleteFleetErrorCode::FleetIdMalformed         then "fleetIdMalformed"
              when AEC::DeleteFleetErrorCode::FleetNotInDeletableState then "fleetNotInDeletableState"
              when AEC::DeleteFleetErrorCode::UnexpectedError          then "unexpectedError"
              else
                raise Exception.new("unknown enum value for 'DeleteFleetErrorCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DeleteFleetErrorCode
      value = pull.read_string
      case value
      when "fleetIdDoesNotExist"      then AEC::DeleteFleetErrorCode::FleetIdDoesNotExist
      when "fleetIdMalformed"         then AEC::DeleteFleetErrorCode::FleetIdMalformed
      when "fleetNotInDeletableState" then AEC::DeleteFleetErrorCode::FleetNotInDeletableState
      when "unexpectedError"          then AEC::DeleteFleetErrorCode::UnexpectedError
      else
        raise Exception.new("unknown enum value for 'DeleteFleetErrorCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DeleteFleetErrorCode::FleetIdDoesNotExist      then "fleetIdDoesNotExist"
      when AEC::DeleteFleetErrorCode::FleetIdMalformed         then "fleetIdMalformed"
      when AEC::DeleteFleetErrorCode::FleetNotInDeletableState then "fleetNotInDeletableState"
      when AEC::DeleteFleetErrorCode::UnexpectedError          then "unexpectedError"
      else
        raise Exception.new("unknown enum value for 'DeleteFleetErrorCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DeleteFleetErrorCode?
      case key
      when "fleetIdDoesNotExist"      then AEC::DeleteFleetErrorCode::FleetIdDoesNotExist
      when "fleetIdMalformed"         then AEC::DeleteFleetErrorCode::FleetIdMalformed
      when "fleetNotInDeletableState" then AEC::DeleteFleetErrorCode::FleetNotInDeletableState
      when "unexpectedError"          then AEC::DeleteFleetErrorCode::UnexpectedError
      else
        nil
      end
    end
  end
end
