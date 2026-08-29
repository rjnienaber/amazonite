private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum BillingMode
    Provisioned
    PayPerRequest

    def self.to_json(e : BillingMode, json : JSON::Builder) : Nil
      value = case e
              when ADDB::BillingMode::Provisioned   then "PROVISIONED"
              when ADDB::BillingMode::PayPerRequest then "PAY_PER_REQUEST"
              else
                raise Exception.new("unknown enum value for 'BillingMode' when serializing to json: '#{e}'")
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

    def to_json_object_key : String
      case self
      when ADDB::BillingMode::Provisioned   then "PROVISIONED"
      when ADDB::BillingMode::PayPerRequest then "PAY_PER_REQUEST"
      else
        raise Exception.new("unknown enum value for 'BillingMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::BillingMode?
      case key
      when "PROVISIONED"     then ADDB::BillingMode::Provisioned
      when "PAY_PER_REQUEST" then ADDB::BillingMode::PayPerRequest
      else
        nil
      end
    end
  end
end
