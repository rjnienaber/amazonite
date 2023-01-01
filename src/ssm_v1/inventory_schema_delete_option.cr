private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum InventorySchemaDeleteOption
    DisableSchema
    DeleteSchema

    def self.to_json(e : InventorySchemaDeleteOption, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::InventorySchemaDeleteOption
      value = pull.read_string
      case value
      when "DisableSchema" then AS::InventorySchemaDeleteOption::DisableSchema
      when "DeleteSchema"  then AS::InventorySchemaDeleteOption::DeleteSchema
      else
        raise Exception.new("unknown enum value for 'InventorySchemaDeleteOption' when deserializing from json: '#{value}'")
      end
    end
  end
end
