private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum SchemaRegistryEventRecordFormat
    Json
    Source

    def self.to_json(e : SchemaRegistryEventRecordFormat, json : JSON::Builder) : Nil
      value = case e
              when AL::SchemaRegistryEventRecordFormat::Json   then "JSON"
              when AL::SchemaRegistryEventRecordFormat::Source then "SOURCE"
              else
                raise Exception.new("unknown enum value for 'SchemaRegistryEventRecordFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::SchemaRegistryEventRecordFormat
      value = pull.read_string
      case value
      when "JSON"   then AL::SchemaRegistryEventRecordFormat::Json
      when "SOURCE" then AL::SchemaRegistryEventRecordFormat::Source
      else
        raise Exception.new("unknown enum value for 'SchemaRegistryEventRecordFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::SchemaRegistryEventRecordFormat::Json   then "JSON"
      when AL::SchemaRegistryEventRecordFormat::Source then "SOURCE"
      else
        raise Exception.new("unknown enum value for 'SchemaRegistryEventRecordFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::SchemaRegistryEventRecordFormat?
      case key
      when "JSON"   then AL::SchemaRegistryEventRecordFormat::Json
      when "SOURCE" then AL::SchemaRegistryEventRecordFormat::Source
      else
        nil
      end
    end
  end
end
