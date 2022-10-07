module Amazonite
  module DynamoDB
    enum AttributeAction
      Add
      Put
      Delete

      def self.to_json(e : AttributeAction, json : JSON::Builder) : Nil
        value = case e
                when Amazonite::DynamoDB::AttributeAction::Add    then "ADD"
                when Amazonite::DynamoDB::AttributeAction::Put    then "PUT"
                when Amazonite::DynamoDB::AttributeAction::Delete then "DELETE"
                else
                  raise Exception.new("unknown enum value for 'AttributeAction' when serializing to json: '#{e.to_s}'")
                end
        json.string(value)
      end

      def self.from_json(pull : JSON::PullParser) : Amazonite::DynamoDB::AttributeAction
        value = pull.read_string
        case value
        when "ADD"    then Amazonite::DynamoDB::AttributeAction::Add
        when "PUT"    then Amazonite::DynamoDB::AttributeAction::Put
        when "DELETE" then Amazonite::DynamoDB::AttributeAction::Delete
        else
          raise Exception.new("unknown enum value for 'AttributeAction' when deserializing from json: '#{value}'")
        end
      end
    end
  end
end
