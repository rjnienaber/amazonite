private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  enum OutputTypeEnum
    Error
    ConditionCheckFailure

    def self.to_json(e : OutputTypeEnum, json : JSON::Builder) : Nil
      value = case e
              when ADDB::OutputTypeEnum::Error                 then "ERROR"
              when ADDB::OutputTypeEnum::ConditionCheckFailure then "CONDITION_CHECK_FAILURE"
              else
                raise Exception.new("unknown enum value for 'OutputTypeEnum' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::OutputTypeEnum
      value = pull.read_string
      case value
      when "ERROR"                   then ADDB::OutputTypeEnum::Error
      when "CONDITION_CHECK_FAILURE" then ADDB::OutputTypeEnum::ConditionCheckFailure
      else
        raise Exception.new("unknown enum value for 'OutputTypeEnum' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::OutputTypeEnum::Error                 then "ERROR"
      when ADDB::OutputTypeEnum::ConditionCheckFailure then "CONDITION_CHECK_FAILURE"
      else
        raise Exception.new("unknown enum value for 'OutputTypeEnum' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::OutputTypeEnum?
      case key
      when "ERROR"                   then ADDB::OutputTypeEnum::Error
      when "CONDITION_CHECK_FAILURE" then ADDB::OutputTypeEnum::ConditionCheckFailure
      else
        nil
      end
    end
  end
end
