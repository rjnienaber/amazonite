private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum ParameterTypeType
    String
    StringList
    Number
    NumberList
    Arn
    ArnList

    def self.to_json(e : ParameterTypeType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AI::ParameterTypeType
      value = pull.read_string
      case value
      when "String"     then AI::ParameterTypeType::String
      when "StringList" then AI::ParameterTypeType::StringList
      when "Number"     then AI::ParameterTypeType::Number
      when "NumberList" then AI::ParameterTypeType::NumberList
      when "Arn"        then AI::ParameterTypeType::Arn
      when "ArnList"    then AI::ParameterTypeType::ArnList
      else
        raise Exception.new("unknown enum value for 'ParameterTypeType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AI::ParameterTypeType?
      case key
      when "String"     then AI::ParameterTypeType::String
      when "StringList" then AI::ParameterTypeType::StringList
      when "Number"     then AI::ParameterTypeType::Number
      when "NumberList" then AI::ParameterTypeType::NumberList
      when "Arn"        then AI::ParameterTypeType::Arn
      when "ArnList"    then AI::ParameterTypeType::ArnList
      else
        nil
      end
    end
  end
end
