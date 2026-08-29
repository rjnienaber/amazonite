private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum InstancePropertyFilterOperator
    Equal
    NotEqual
    BeginWith
    LessThan
    GreaterThan

    def self.to_json(e : InstancePropertyFilterOperator, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::InstancePropertyFilterOperator
      value = pull.read_string
      case value
      when "Equal"       then AS::InstancePropertyFilterOperator::Equal
      when "NotEqual"    then AS::InstancePropertyFilterOperator::NotEqual
      when "BeginWith"   then AS::InstancePropertyFilterOperator::BeginWith
      when "LessThan"    then AS::InstancePropertyFilterOperator::LessThan
      when "GreaterThan" then AS::InstancePropertyFilterOperator::GreaterThan
      else
        raise Exception.new("unknown enum value for 'InstancePropertyFilterOperator' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::InstancePropertyFilterOperator?
      case key
      when "Equal"       then AS::InstancePropertyFilterOperator::Equal
      when "NotEqual"    then AS::InstancePropertyFilterOperator::NotEqual
      when "BeginWith"   then AS::InstancePropertyFilterOperator::BeginWith
      when "LessThan"    then AS::InstancePropertyFilterOperator::LessThan
      when "GreaterThan" then AS::InstancePropertyFilterOperator::GreaterThan
      else
        nil
      end
    end
  end
end
