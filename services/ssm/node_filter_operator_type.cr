private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum NodeFilterOperatorType
    Equal
    NotEqual
    BeginWith

    def self.to_json(e : NodeFilterOperatorType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::NodeFilterOperatorType
      value = pull.read_string
      case value
      when "Equal"     then AS::NodeFilterOperatorType::Equal
      when "NotEqual"  then AS::NodeFilterOperatorType::NotEqual
      when "BeginWith" then AS::NodeFilterOperatorType::BeginWith
      else
        raise Exception.new("unknown enum value for 'NodeFilterOperatorType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::NodeFilterOperatorType?
      case key
      when "Equal"     then AS::NodeFilterOperatorType::Equal
      when "NotEqual"  then AS::NodeFilterOperatorType::NotEqual
      when "BeginWith" then AS::NodeFilterOperatorType::BeginWith
      else
        nil
      end
    end
  end
end
