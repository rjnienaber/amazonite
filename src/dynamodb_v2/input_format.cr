private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum InputFormat
    DynamodbJson
    Ion
    Csv

    def self.to_json(e : InputFormat, json : JSON::Builder) : Nil
      value = case e
              when ADDB::InputFormat::DynamodbJson then "DYNAMODB_JSON"
              when ADDB::InputFormat::Ion          then "ION"
              when ADDB::InputFormat::Csv          then "CSV"
              else
                raise Exception.new("unknown enum value for 'InputFormat' when serializing to json: '#{e.to_s}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::InputFormat
      value = pull.read_string
      case value
      when "DYNAMODB_JSON" then ADDB::InputFormat::DynamodbJson
      when "ION"           then ADDB::InputFormat::Ion
      when "CSV"           then ADDB::InputFormat::Csv
      else
        raise Exception.new("unknown enum value for 'InputFormat' when deserializing from json: '#{value}'")
      end
    end
  end
end
