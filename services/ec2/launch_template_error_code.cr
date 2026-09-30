private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LaunchTemplateErrorCode
    LaunchTemplateIdDoesNotExist
    LaunchTemplateIdMalformed
    LaunchTemplateNameDoesNotExist
    LaunchTemplateNameMalformed
    LaunchTemplateVersionDoesNotExist
    UnexpectedError

    def self.to_json(e : LaunchTemplateErrorCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::LaunchTemplateErrorCode::LaunchTemplateIdDoesNotExist      then "launchTemplateIdDoesNotExist"
              when AEC::LaunchTemplateErrorCode::LaunchTemplateIdMalformed         then "launchTemplateIdMalformed"
              when AEC::LaunchTemplateErrorCode::LaunchTemplateNameDoesNotExist    then "launchTemplateNameDoesNotExist"
              when AEC::LaunchTemplateErrorCode::LaunchTemplateNameMalformed       then "launchTemplateNameMalformed"
              when AEC::LaunchTemplateErrorCode::LaunchTemplateVersionDoesNotExist then "launchTemplateVersionDoesNotExist"
              when AEC::LaunchTemplateErrorCode::UnexpectedError                   then "unexpectedError"
              else
                raise Exception.new("unknown enum value for 'LaunchTemplateErrorCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LaunchTemplateErrorCode
      value = pull.read_string
      case value
      when "launchTemplateIdDoesNotExist"      then AEC::LaunchTemplateErrorCode::LaunchTemplateIdDoesNotExist
      when "launchTemplateIdMalformed"         then AEC::LaunchTemplateErrorCode::LaunchTemplateIdMalformed
      when "launchTemplateNameDoesNotExist"    then AEC::LaunchTemplateErrorCode::LaunchTemplateNameDoesNotExist
      when "launchTemplateNameMalformed"       then AEC::LaunchTemplateErrorCode::LaunchTemplateNameMalformed
      when "launchTemplateVersionDoesNotExist" then AEC::LaunchTemplateErrorCode::LaunchTemplateVersionDoesNotExist
      when "unexpectedError"                   then AEC::LaunchTemplateErrorCode::UnexpectedError
      else
        raise Exception.new("unknown enum value for 'LaunchTemplateErrorCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LaunchTemplateErrorCode::LaunchTemplateIdDoesNotExist      then "launchTemplateIdDoesNotExist"
      when AEC::LaunchTemplateErrorCode::LaunchTemplateIdMalformed         then "launchTemplateIdMalformed"
      when AEC::LaunchTemplateErrorCode::LaunchTemplateNameDoesNotExist    then "launchTemplateNameDoesNotExist"
      when AEC::LaunchTemplateErrorCode::LaunchTemplateNameMalformed       then "launchTemplateNameMalformed"
      when AEC::LaunchTemplateErrorCode::LaunchTemplateVersionDoesNotExist then "launchTemplateVersionDoesNotExist"
      when AEC::LaunchTemplateErrorCode::UnexpectedError                   then "unexpectedError"
      else
        raise Exception.new("unknown enum value for 'LaunchTemplateErrorCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LaunchTemplateErrorCode?
      case key
      when "launchTemplateIdDoesNotExist"      then AEC::LaunchTemplateErrorCode::LaunchTemplateIdDoesNotExist
      when "launchTemplateIdMalformed"         then AEC::LaunchTemplateErrorCode::LaunchTemplateIdMalformed
      when "launchTemplateNameDoesNotExist"    then AEC::LaunchTemplateErrorCode::LaunchTemplateNameDoesNotExist
      when "launchTemplateNameMalformed"       then AEC::LaunchTemplateErrorCode::LaunchTemplateNameMalformed
      when "launchTemplateVersionDoesNotExist" then AEC::LaunchTemplateErrorCode::LaunchTemplateVersionDoesNotExist
      when "unexpectedError"                   then AEC::LaunchTemplateErrorCode::UnexpectedError
      else
        nil
      end
    end
  end
end
