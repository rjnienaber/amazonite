private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum OpsItemEventFilterOperator
    Equal

    def self.to_json(e : OpsItemEventFilterOperator, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::OpsItemEventFilterOperator
      value = pull.read_string
      case value
      when "Equal" then AS::OpsItemEventFilterOperator::Equal
      else
        raise Exception.new("unknown enum value for 'OpsItemEventFilterOperator' when deserializing from json: '#{value}'")
      end
    end
  end
end
