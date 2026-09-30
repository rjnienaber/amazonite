private alias AS = Amazonite::Ssm

module Amazonite::Ssm
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

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::OpsFilterOperatorType?
      case key
      when "Equal"       then AS::OpsFilterOperatorType::Equal
      when "NotEqual"    then AS::OpsFilterOperatorType::NotEqual
      when "BeginWith"   then AS::OpsFilterOperatorType::BeginWith
      when "LessThan"    then AS::OpsFilterOperatorType::LessThan
      when "GreaterThan" then AS::OpsFilterOperatorType::GreaterThan
      when "Exists"      then AS::OpsFilterOperatorType::Exists
      else
        nil
      end
    end
  end
end
