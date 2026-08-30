private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum DeliverySourceConfigurationSchemaValueType
    String
    Boolean
    Int
    Double
    Long

    def self.to_json(e : DeliverySourceConfigurationSchemaValueType, json : JSON::Builder) : Nil
      value = case e
              when ACWL::DeliverySourceConfigurationSchemaValueType::String  then "string"
              when ACWL::DeliverySourceConfigurationSchemaValueType::Boolean then "boolean"
              when ACWL::DeliverySourceConfigurationSchemaValueType::Int     then "int"
              when ACWL::DeliverySourceConfigurationSchemaValueType::Double  then "double"
              when ACWL::DeliverySourceConfigurationSchemaValueType::Long    then "long"
              else
                raise Exception.new("unknown enum value for 'DeliverySourceConfigurationSchemaValueType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::DeliverySourceConfigurationSchemaValueType
      value = pull.read_string
      case value
      when "string"  then ACWL::DeliverySourceConfigurationSchemaValueType::String
      when "boolean" then ACWL::DeliverySourceConfigurationSchemaValueType::Boolean
      when "int"     then ACWL::DeliverySourceConfigurationSchemaValueType::Int
      when "double"  then ACWL::DeliverySourceConfigurationSchemaValueType::Double
      when "long"    then ACWL::DeliverySourceConfigurationSchemaValueType::Long
      else
        raise Exception.new("unknown enum value for 'DeliverySourceConfigurationSchemaValueType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::DeliverySourceConfigurationSchemaValueType::String  then "string"
      when ACWL::DeliverySourceConfigurationSchemaValueType::Boolean then "boolean"
      when ACWL::DeliverySourceConfigurationSchemaValueType::Int     then "int"
      when ACWL::DeliverySourceConfigurationSchemaValueType::Double  then "double"
      when ACWL::DeliverySourceConfigurationSchemaValueType::Long    then "long"
      else
        raise Exception.new("unknown enum value for 'DeliverySourceConfigurationSchemaValueType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::DeliverySourceConfigurationSchemaValueType?
      case key
      when "string"  then ACWL::DeliverySourceConfigurationSchemaValueType::String
      when "boolean" then ACWL::DeliverySourceConfigurationSchemaValueType::Boolean
      when "int"     then ACWL::DeliverySourceConfigurationSchemaValueType::Int
      when "double"  then ACWL::DeliverySourceConfigurationSchemaValueType::Double
      when "long"    then ACWL::DeliverySourceConfigurationSchemaValueType::Long
      else
        nil
      end
    end
  end
end
