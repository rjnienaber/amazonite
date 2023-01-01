private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum OpsItemRelatedItemsFilterOperator
    Equal

    def self.to_json(e : OpsItemRelatedItemsFilterOperator, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::OpsItemRelatedItemsFilterOperator
      value = pull.read_string
      case value
      when "Equal" then AS::OpsItemRelatedItemsFilterOperator::Equal
      else
        raise Exception.new("unknown enum value for 'OpsItemRelatedItemsFilterOperator' when deserializing from json: '#{value}'")
      end
    end
  end
end
