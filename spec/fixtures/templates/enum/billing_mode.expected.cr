module Amazonite
  module DynamoDB
    enum BillingMode
      Provisioned
      PayPerRequest

      def self.to_json(e : BillingMode, json : JSON::Builder) : Nil
        value = case e
                when Amazonite::DynamoDB::BillingMode::Provisioned   then "PROVISIONED"
                when Amazonite::DynamoDB::BillingMode::PayPerRequest then "PAY_PER_REQUEST"
                else
                  raise Exception.new("unknown enum value for 'BillingMode' when serializing to json: '#{e.to_s}'")
                end
        json.string(value)
      end

      def self.from_json(pull : JSON::PullParser) : Amazonite::DynamoDB::BillingMode
        value = pull.read_string
        case value
        when "PROVISIONED"     then Amazonite::DynamoDB::BillingMode::Provisioned
        when "PAY_PER_REQUEST" then Amazonite::DynamoDB::BillingMode::PayPerRequest
        else
          raise Exception.new("unknown enum value for 'BillingMode' when deserializing from json: '#{value}'")
        end
      end
    end
  end
end
