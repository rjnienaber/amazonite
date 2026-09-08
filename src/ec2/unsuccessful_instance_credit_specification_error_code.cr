private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum UnsuccessfulInstanceCreditSpecificationErrorCode
    InvalidInstanceIdMalformed
    InvalidInstanceIdNotFound
    IncorrectInstanceState
    InstanceCreditSpecificationNotSupported

    def self.to_json(e : UnsuccessfulInstanceCreditSpecificationErrorCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::InvalidInstanceIdMalformed              then "InvalidInstanceID.Malformed"
              when AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::InvalidInstanceIdNotFound               then "InvalidInstanceID.NotFound"
              when AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::IncorrectInstanceState                  then "IncorrectInstanceState"
              when AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::InstanceCreditSpecificationNotSupported then "InstanceCreditSpecification.NotSupported"
              else
                raise Exception.new("unknown enum value for 'UnsuccessfulInstanceCreditSpecificationErrorCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::UnsuccessfulInstanceCreditSpecificationErrorCode
      value = pull.read_string
      case value
      when "InvalidInstanceID.Malformed"              then AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::InvalidInstanceIdMalformed
      when "InvalidInstanceID.NotFound"               then AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::InvalidInstanceIdNotFound
      when "IncorrectInstanceState"                   then AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::IncorrectInstanceState
      when "InstanceCreditSpecification.NotSupported" then AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::InstanceCreditSpecificationNotSupported
      else
        raise Exception.new("unknown enum value for 'UnsuccessfulInstanceCreditSpecificationErrorCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::InvalidInstanceIdMalformed              then "InvalidInstanceID.Malformed"
      when AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::InvalidInstanceIdNotFound               then "InvalidInstanceID.NotFound"
      when AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::IncorrectInstanceState                  then "IncorrectInstanceState"
      when AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::InstanceCreditSpecificationNotSupported then "InstanceCreditSpecification.NotSupported"
      else
        raise Exception.new("unknown enum value for 'UnsuccessfulInstanceCreditSpecificationErrorCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::UnsuccessfulInstanceCreditSpecificationErrorCode?
      case key
      when "InvalidInstanceID.Malformed"              then AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::InvalidInstanceIdMalformed
      when "InvalidInstanceID.NotFound"               then AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::InvalidInstanceIdNotFound
      when "IncorrectInstanceState"                   then AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::IncorrectInstanceState
      when "InstanceCreditSpecification.NotSupported" then AEC::UnsuccessfulInstanceCreditSpecificationErrorCode::InstanceCreditSpecificationNotSupported
      else
        nil
      end
    end
  end
end
