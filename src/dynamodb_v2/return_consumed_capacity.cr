private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum ReturnConsumedCapacity
    Indexes
    Total
    None

    def self.to_json(e : ReturnConsumedCapacity, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ReturnConsumedCapacity::Indexes then "INDEXES"
              when ADDB::ReturnConsumedCapacity::Total   then "TOTAL"
              when ADDB::ReturnConsumedCapacity::None    then "NONE"
              else
                raise Exception.new("unknown enum value for 'ReturnConsumedCapacity' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ReturnConsumedCapacity
      value = pull.read_string
      case value
      when "INDEXES" then ADDB::ReturnConsumedCapacity::Indexes
      when "TOTAL"   then ADDB::ReturnConsumedCapacity::Total
      when "NONE"    then ADDB::ReturnConsumedCapacity::None
      else
        raise Exception.new("unknown enum value for 'ReturnConsumedCapacity' when deserializing from json: '#{value}'")
      end
    end
  end
end
