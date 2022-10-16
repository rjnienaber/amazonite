private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum BillingMode
    Provisioned
    PayPerRequest

    def self.to_json(e : BillingMode, json : JSON::Builder) : Nil
      value = case e
              when ADDB::BillingMode::Provisioned   then "PROVISIONED"
              when ADDB::BillingMode::PayPerRequest then "PAY_PER_REQUEST"
              else
                raise Exception.new("unknown enum value for 'BillingMode' when serializing to json: '#{e.to_s}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::BillingMode
      value = pull.read_string
      case value
      when "PROVISIONED"     then ADDB::BillingMode::Provisioned
      when "PAY_PER_REQUEST" then ADDB::BillingMode::PayPerRequest
      else
        raise Exception.new("unknown enum value for 'BillingMode' when deserializing from json: '#{value}'")
      end
    end
  end
end
