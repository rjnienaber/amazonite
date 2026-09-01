private alias AI = Amazonite::Iam

module Amazonite::Iam
  enum ContextKeyTypeEnum
    String
    StringList
    Numeric
    NumericList
    Boolean
    BooleanList
    Ip
    IpList
    Binary
    BinaryList
    Date
    DateList

    def self.to_json(e : ContextKeyTypeEnum, json : JSON::Builder) : Nil
      value = case e
              when AI::ContextKeyTypeEnum::String      then "string"
              when AI::ContextKeyTypeEnum::StringList  then "stringList"
              when AI::ContextKeyTypeEnum::Numeric     then "numeric"
              when AI::ContextKeyTypeEnum::NumericList then "numericList"
              when AI::ContextKeyTypeEnum::Boolean     then "boolean"
              when AI::ContextKeyTypeEnum::BooleanList then "booleanList"
              when AI::ContextKeyTypeEnum::Ip          then "ip"
              when AI::ContextKeyTypeEnum::IpList      then "ipList"
              when AI::ContextKeyTypeEnum::Binary      then "binary"
              when AI::ContextKeyTypeEnum::BinaryList  then "binaryList"
              when AI::ContextKeyTypeEnum::Date        then "date"
              when AI::ContextKeyTypeEnum::DateList    then "dateList"
              else
                raise Exception.new("unknown enum value for 'ContextKeyTypeEnum' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::ContextKeyTypeEnum
      value = pull.read_string
      case value
      when "string"      then AI::ContextKeyTypeEnum::String
      when "stringList"  then AI::ContextKeyTypeEnum::StringList
      when "numeric"     then AI::ContextKeyTypeEnum::Numeric
      when "numericList" then AI::ContextKeyTypeEnum::NumericList
      when "boolean"     then AI::ContextKeyTypeEnum::Boolean
      when "booleanList" then AI::ContextKeyTypeEnum::BooleanList
      when "ip"          then AI::ContextKeyTypeEnum::Ip
      when "ipList"      then AI::ContextKeyTypeEnum::IpList
      when "binary"      then AI::ContextKeyTypeEnum::Binary
      when "binaryList"  then AI::ContextKeyTypeEnum::BinaryList
      when "date"        then AI::ContextKeyTypeEnum::Date
      when "dateList"    then AI::ContextKeyTypeEnum::DateList
      else
        raise Exception.new("unknown enum value for 'ContextKeyTypeEnum' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::ContextKeyTypeEnum::String      then "string"
      when AI::ContextKeyTypeEnum::StringList  then "stringList"
      when AI::ContextKeyTypeEnum::Numeric     then "numeric"
      when AI::ContextKeyTypeEnum::NumericList then "numericList"
      when AI::ContextKeyTypeEnum::Boolean     then "boolean"
      when AI::ContextKeyTypeEnum::BooleanList then "booleanList"
      when AI::ContextKeyTypeEnum::Ip          then "ip"
      when AI::ContextKeyTypeEnum::IpList      then "ipList"
      when AI::ContextKeyTypeEnum::Binary      then "binary"
      when AI::ContextKeyTypeEnum::BinaryList  then "binaryList"
      when AI::ContextKeyTypeEnum::Date        then "date"
      when AI::ContextKeyTypeEnum::DateList    then "dateList"
      else
        raise Exception.new("unknown enum value for 'ContextKeyTypeEnum' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::ContextKeyTypeEnum?
      case key
      when "string"      then AI::ContextKeyTypeEnum::String
      when "stringList"  then AI::ContextKeyTypeEnum::StringList
      when "numeric"     then AI::ContextKeyTypeEnum::Numeric
      when "numericList" then AI::ContextKeyTypeEnum::NumericList
      when "boolean"     then AI::ContextKeyTypeEnum::Boolean
      when "booleanList" then AI::ContextKeyTypeEnum::BooleanList
      when "ip"          then AI::ContextKeyTypeEnum::Ip
      when "ipList"      then AI::ContextKeyTypeEnum::IpList
      when "binary"      then AI::ContextKeyTypeEnum::Binary
      when "binaryList"  then AI::ContextKeyTypeEnum::BinaryList
      when "date"        then AI::ContextKeyTypeEnum::Date
      when "dateList"    then AI::ContextKeyTypeEnum::DateList
      else
        nil
      end
    end
  end
end
