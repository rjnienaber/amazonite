private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum InstancePatchStateOperatorType
    Equal
    NotEqual
    LessThan
    GreaterThan

    def self.to_json(e : InstancePatchStateOperatorType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::InstancePatchStateOperatorType
      value = pull.read_string
      case value
      when "Equal"       then AS::InstancePatchStateOperatorType::Equal
      when "NotEqual"    then AS::InstancePatchStateOperatorType::NotEqual
      when "LessThan"    then AS::InstancePatchStateOperatorType::LessThan
      when "GreaterThan" then AS::InstancePatchStateOperatorType::GreaterThan
      else
        raise Exception.new("unknown enum value for 'InstancePatchStateOperatorType' when deserializing from json: '#{value}'")
      end
    end
  end
end
