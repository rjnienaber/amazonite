private alias AI = Amazonite::Iam

module Amazonite::Iam
  enum PolicyParameterTypeEnum
    String
    StringList

    def self.to_json(e : PolicyParameterTypeEnum, json : JSON::Builder) : Nil
      value = case e
              when AI::PolicyParameterTypeEnum::String     then "string"
              when AI::PolicyParameterTypeEnum::StringList then "stringList"
              else
                raise Exception.new("unknown enum value for 'PolicyParameterTypeEnum' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::PolicyParameterTypeEnum
      value = pull.read_string
      case value
      when "string"     then AI::PolicyParameterTypeEnum::String
      when "stringList" then AI::PolicyParameterTypeEnum::StringList
      else
        raise Exception.new("unknown enum value for 'PolicyParameterTypeEnum' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::PolicyParameterTypeEnum::String     then "string"
      when AI::PolicyParameterTypeEnum::StringList then "stringList"
      else
        raise Exception.new("unknown enum value for 'PolicyParameterTypeEnum' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::PolicyParameterTypeEnum?
      case key
      when "string"     then AI::PolicyParameterTypeEnum::String
      when "stringList" then AI::PolicyParameterTypeEnum::StringList
      else
        nil
      end
    end
  end
end
