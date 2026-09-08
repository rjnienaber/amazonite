private alias AS = Amazonite::S3

module Amazonite::S3
  enum ExpressionType
    Sql

    def self.to_json(e : ExpressionType, json : JSON::Builder) : Nil
      value = case e
              when AS::ExpressionType::Sql then "SQL"
              else
                raise Exception.new("unknown enum value for 'ExpressionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ExpressionType
      value = pull.read_string
      case value
      when "SQL" then AS::ExpressionType::Sql
      else
        raise Exception.new("unknown enum value for 'ExpressionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ExpressionType::Sql then "SQL"
      else
        raise Exception.new("unknown enum value for 'ExpressionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ExpressionType?
      case key
      when "SQL" then AS::ExpressionType::Sql
      else
        nil
      end
    end
  end
end
