private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum OpsFilterOperatorType
    Equal
    NotEqual
    BeginWith
    LessThan
    GreaterThan
    Exists

    def self.to_json(e : OpsFilterOperatorType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::OpsFilterOperatorType
      value = pull.read_string
      case value
      when "Equal"       then AS::OpsFilterOperatorType::Equal
      when "NotEqual"    then AS::OpsFilterOperatorType::NotEqual
      when "BeginWith"   then AS::OpsFilterOperatorType::BeginWith
      when "LessThan"    then AS::OpsFilterOperatorType::LessThan
      when "GreaterThan" then AS::OpsFilterOperatorType::GreaterThan
      when "Exists"      then AS::OpsFilterOperatorType::Exists
      else
        raise Exception.new("unknown enum value for 'OpsFilterOperatorType' when deserializing from json: '#{value}'")
      end
    end
  end
end
