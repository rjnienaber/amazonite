private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum InventoryAttributeDataType
    String
    Number

    def self.to_json(e : InventoryAttributeDataType, json : JSON::Builder) : Nil
      value = case e
              when AS::InventoryAttributeDataType::String then "string"
              when AS::InventoryAttributeDataType::Number then "number"
              else
                raise Exception.new("unknown enum value for 'InventoryAttributeDataType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::InventoryAttributeDataType
      value = pull.read_string
      case value
      when "string" then AS::InventoryAttributeDataType::String
      when "number" then AS::InventoryAttributeDataType::Number
      else
        raise Exception.new("unknown enum value for 'InventoryAttributeDataType' when deserializing from json: '#{value}'")
      end
    end
  end
end
