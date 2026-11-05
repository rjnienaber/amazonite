private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  enum BulkOperationInputFormat
    DynamodbJson
    Ion

    def self.to_json(e : BulkOperationInputFormat, json : JSON::Builder) : Nil
      value = case e
              when ADDB::BulkOperationInputFormat::DynamodbJson then "DYNAMODB_JSON"
              when ADDB::BulkOperationInputFormat::Ion          then "ION"
              else
                raise Exception.new("unknown enum value for 'BulkOperationInputFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::BulkOperationInputFormat
      value = pull.read_string
      case value
      when "DYNAMODB_JSON" then ADDB::BulkOperationInputFormat::DynamodbJson
      when "ION"           then ADDB::BulkOperationInputFormat::Ion
      else
        raise Exception.new("unknown enum value for 'BulkOperationInputFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::BulkOperationInputFormat::DynamodbJson then "DYNAMODB_JSON"
      when ADDB::BulkOperationInputFormat::Ion          then "ION"
      else
        raise Exception.new("unknown enum value for 'BulkOperationInputFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::BulkOperationInputFormat?
      case key
      when "DYNAMODB_JSON" then ADDB::BulkOperationInputFormat::DynamodbJson
      when "ION"           then ADDB::BulkOperationInputFormat::Ion
      else
        nil
      end
    end
  end
end
