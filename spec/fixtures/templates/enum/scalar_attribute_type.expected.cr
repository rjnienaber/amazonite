module Amazonite
  module DynamoDB
    enum ScalarAttributeType
      S
      N
      B

      def self.to_json(e : ScalarAttributeType, json : JSON::Builder) : Nil
        json.string(e.to_s)
      end

      def self.from_json(pull : JSON::PullParser) : Amazonite::DynamoDB::ScalarAttributeType
        value = pull.read_string
        case value
        when "S" then Amazonite::DynamoDB::ScalarAttributeType::S
        when "N" then Amazonite::DynamoDB::ScalarAttributeType::N
        when "B" then Amazonite::DynamoDB::ScalarAttributeType::B
        else
          raise Exception.new("unknown enum value for 'ScalarAttributeType' when deserializing from json: '#{value}'")
        end
      end
    end
  end
end
