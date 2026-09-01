private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum KafkaSchemaValidationAttribute
    Key
    Value

    def self.to_json(e : KafkaSchemaValidationAttribute, json : JSON::Builder) : Nil
      value = case e
              when AL::KafkaSchemaValidationAttribute::Key   then "KEY"
              when AL::KafkaSchemaValidationAttribute::Value then "VALUE"
              else
                raise Exception.new("unknown enum value for 'KafkaSchemaValidationAttribute' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::KafkaSchemaValidationAttribute
      value = pull.read_string
      case value
      when "KEY"   then AL::KafkaSchemaValidationAttribute::Key
      when "VALUE" then AL::KafkaSchemaValidationAttribute::Value
      else
        raise Exception.new("unknown enum value for 'KafkaSchemaValidationAttribute' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::KafkaSchemaValidationAttribute::Key   then "KEY"
      when AL::KafkaSchemaValidationAttribute::Value then "VALUE"
      else
        raise Exception.new("unknown enum value for 'KafkaSchemaValidationAttribute' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::KafkaSchemaValidationAttribute?
      case key
      when "KEY"   then AL::KafkaSchemaValidationAttribute::Key
      when "VALUE" then AL::KafkaSchemaValidationAttribute::Value
      else
        nil
      end
    end
  end
end
