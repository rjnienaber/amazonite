private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum InventoryQueryOperatorType
    Equal
    NotEqual
    BeginWith
    LessThan
    GreaterThan
    Exists

    def self.to_json(e : InventoryQueryOperatorType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::InventoryQueryOperatorType
      value = pull.read_string
      case value
      when "Equal"       then AS::InventoryQueryOperatorType::Equal
      when "NotEqual"    then AS::InventoryQueryOperatorType::NotEqual
      when "BeginWith"   then AS::InventoryQueryOperatorType::BeginWith
      when "LessThan"    then AS::InventoryQueryOperatorType::LessThan
      when "GreaterThan" then AS::InventoryQueryOperatorType::GreaterThan
      when "Exists"      then AS::InventoryQueryOperatorType::Exists
      else
        raise Exception.new("unknown enum value for 'InventoryQueryOperatorType' when deserializing from json: '#{value}'")
      end
    end
  end
end
