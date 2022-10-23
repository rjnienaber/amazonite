private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum ReturnValuesOnConditionCheckFailure
    AllOld
    None

    def self.to_json(e : ReturnValuesOnConditionCheckFailure, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ReturnValuesOnConditionCheckFailure::AllOld then "ALL_OLD"
              when ADDB::ReturnValuesOnConditionCheckFailure::None   then "NONE"
              else
                raise Exception.new("unknown enum value for 'ReturnValuesOnConditionCheckFailure' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ReturnValuesOnConditionCheckFailure
      value = pull.read_string
      case value
      when "ALL_OLD" then ADDB::ReturnValuesOnConditionCheckFailure::AllOld
      when "NONE"    then ADDB::ReturnValuesOnConditionCheckFailure::None
      else
        raise Exception.new("unknown enum value for 'ReturnValuesOnConditionCheckFailure' when deserializing from json: '#{value}'")
      end
    end
  end
end
