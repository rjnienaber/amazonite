private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Determines the level of detail about either provisioned or on-demand throughput consumption that
  # is returned in the response:
  #
  # - `INDEXES` - The response includes the aggregate `ConsumedCapacity` for the operation, together
  # with `ConsumedCapacity` for each table and secondary index that was accessed.
  #
  # Note that some operations, such as `GetItem` and `BatchGetItem`, do not access any indexes at
  # all. In these cases, specifying `INDEXES` will only return `ConsumedCapacity` information for
  # table(s).
  #
  # - `TOTAL` - The response includes only the aggregate `ConsumedCapacity` for the operation.
  #
  # - `NONE` - No `ConsumedCapacity` details are included in the response.
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

    def to_json_object_key : String
      case self
      when ADDB::ReturnConsumedCapacity::Indexes then "INDEXES"
      when ADDB::ReturnConsumedCapacity::Total   then "TOTAL"
      when ADDB::ReturnConsumedCapacity::None    then "NONE"
      else
        raise Exception.new("unknown enum value for 'ReturnConsumedCapacity' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::ReturnConsumedCapacity?
      case key
      when "INDEXES" then ADDB::ReturnConsumedCapacity::Indexes
      when "TOTAL"   then ADDB::ReturnConsumedCapacity::Total
      when "NONE"    then ADDB::ReturnConsumedCapacity::None
      else
        nil
      end
    end
  end
end
