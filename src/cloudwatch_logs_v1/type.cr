private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum Type
    Boolean
    Integer
    Double
    String

    def self.to_json(e : Type, json : JSON::Builder) : Nil
      value = case e
              when ACWL::Type::Boolean then "boolean"
              when ACWL::Type::Integer then "integer"
              when ACWL::Type::Double  then "double"
              when ACWL::Type::String  then "string"
              else
                raise Exception.new("unknown enum value for 'Type' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::Type
      value = pull.read_string
      case value
      when "boolean" then ACWL::Type::Boolean
      when "integer" then ACWL::Type::Integer
      when "double"  then ACWL::Type::Double
      when "string"  then ACWL::Type::String
      else
        raise Exception.new("unknown enum value for 'Type' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::Type::Boolean then "boolean"
      when ACWL::Type::Integer then "integer"
      when ACWL::Type::Double  then "double"
      when ACWL::Type::String  then "string"
      else
        raise Exception.new("unknown enum value for 'Type' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::Type?
      case key
      when "boolean" then ACWL::Type::Boolean
      when "integer" then ACWL::Type::Integer
      when "double"  then ACWL::Type::Double
      when "string"  then ACWL::Type::String
      else
        nil
      end
    end
  end
end
