private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum ExportFormat
    DynamodbJson
    Ion

    def self.to_json(e : ExportFormat, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ExportFormat::DynamodbJson then "DYNAMODB_JSON"
              when ADDB::ExportFormat::Ion          then "ION"
              else
                raise Exception.new("unknown enum value for 'ExportFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ExportFormat
      value = pull.read_string
      case value
      when "DYNAMODB_JSON" then ADDB::ExportFormat::DynamodbJson
      when "ION"           then ADDB::ExportFormat::Ion
      else
        raise Exception.new("unknown enum value for 'ExportFormat' when deserializing from json: '#{value}'")
      end
    end
  end
end
