private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum RegistrationStatus
    Complete
    InProgress
    Failed

    def self.to_json(e : RegistrationStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::RegistrationStatus::Complete   then "COMPLETE"
              when ACF::RegistrationStatus::InProgress then "IN_PROGRESS"
              when ACF::RegistrationStatus::Failed     then "FAILED"
              else
                raise Exception.new("unknown enum value for 'RegistrationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::RegistrationStatus
      value = pull.read_string
      case value
      when "COMPLETE"    then ACF::RegistrationStatus::Complete
      when "IN_PROGRESS" then ACF::RegistrationStatus::InProgress
      when "FAILED"      then ACF::RegistrationStatus::Failed
      else
        raise Exception.new("unknown enum value for 'RegistrationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::RegistrationStatus::Complete   then "COMPLETE"
      when ACF::RegistrationStatus::InProgress then "IN_PROGRESS"
      when ACF::RegistrationStatus::Failed     then "FAILED"
      else
        raise Exception.new("unknown enum value for 'RegistrationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::RegistrationStatus?
      case key
      when "COMPLETE"    then ACF::RegistrationStatus::Complete
      when "IN_PROGRESS" then ACF::RegistrationStatus::InProgress
      when "FAILED"      then ACF::RegistrationStatus::Failed
      else
        nil
      end
    end
  end
end
