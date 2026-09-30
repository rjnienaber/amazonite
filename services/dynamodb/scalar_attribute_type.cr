private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  enum ScalarAttributeType
    S
    N
    B

    def self.to_json(e : ScalarAttributeType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ScalarAttributeType
      value = pull.read_string
      case value
      when "S" then ADDB::ScalarAttributeType::S
      when "N" then ADDB::ScalarAttributeType::N
      when "B" then ADDB::ScalarAttributeType::B
      else
        raise Exception.new("unknown enum value for 'ScalarAttributeType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ADDB::ScalarAttributeType?
      case key
      when "S" then ADDB::ScalarAttributeType::S
      when "N" then ADDB::ScalarAttributeType::N
      when "B" then ADDB::ScalarAttributeType::B
      else
        nil
      end
    end
  end
end
