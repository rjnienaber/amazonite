private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum OpsItemFilterOperator
    Equal
    Contains
    GreaterThan
    LessThan

    def self.to_json(e : OpsItemFilterOperator, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::OpsItemFilterOperator
      value = pull.read_string
      case value
      when "Equal"       then AS::OpsItemFilterOperator::Equal
      when "Contains"    then AS::OpsItemFilterOperator::Contains
      when "GreaterThan" then AS::OpsItemFilterOperator::GreaterThan
      when "LessThan"    then AS::OpsItemFilterOperator::LessThan
      else
        raise Exception.new("unknown enum value for 'OpsItemFilterOperator' when deserializing from json: '#{value}'")
      end
    end
  end
end
