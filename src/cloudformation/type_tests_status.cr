private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum TypeTestsStatus
    Passed
    Failed
    InProgress
    NotTested

    def self.to_json(e : TypeTestsStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::TypeTestsStatus::Passed     then "PASSED"
              when ACF::TypeTestsStatus::Failed     then "FAILED"
              when ACF::TypeTestsStatus::InProgress then "IN_PROGRESS"
              when ACF::TypeTestsStatus::NotTested  then "NOT_TESTED"
              else
                raise Exception.new("unknown enum value for 'TypeTestsStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::TypeTestsStatus
      value = pull.read_string
      case value
      when "PASSED"      then ACF::TypeTestsStatus::Passed
      when "FAILED"      then ACF::TypeTestsStatus::Failed
      when "IN_PROGRESS" then ACF::TypeTestsStatus::InProgress
      when "NOT_TESTED"  then ACF::TypeTestsStatus::NotTested
      else
        raise Exception.new("unknown enum value for 'TypeTestsStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::TypeTestsStatus::Passed     then "PASSED"
      when ACF::TypeTestsStatus::Failed     then "FAILED"
      when ACF::TypeTestsStatus::InProgress then "IN_PROGRESS"
      when ACF::TypeTestsStatus::NotTested  then "NOT_TESTED"
      else
        raise Exception.new("unknown enum value for 'TypeTestsStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::TypeTestsStatus?
      case key
      when "PASSED"      then ACF::TypeTestsStatus::Passed
      when "FAILED"      then ACF::TypeTestsStatus::Failed
      when "IN_PROGRESS" then ACF::TypeTestsStatus::InProgress
      when "NOT_TESTED"  then ACF::TypeTestsStatus::NotTested
      else
        nil
      end
    end
  end
end
