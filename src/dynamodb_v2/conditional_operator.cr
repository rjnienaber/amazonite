private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum ConditionalOperator
    And
    Or

    def self.to_json(e : ConditionalOperator, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ConditionalOperator::And then "AND"
              when ADDB::ConditionalOperator::Or  then "OR"
              else
                raise Exception.new("unknown enum value for 'ConditionalOperator' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ConditionalOperator
      value = pull.read_string
      case value
      when "AND" then ADDB::ConditionalOperator::And
      when "OR"  then ADDB::ConditionalOperator::Or
      else
        raise Exception.new("unknown enum value for 'ConditionalOperator' when deserializing from json: '#{value}'")
      end
    end
  end
end
