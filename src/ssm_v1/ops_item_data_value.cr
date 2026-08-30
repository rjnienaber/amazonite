private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # An object that defines the value of the key and its type in the OperationalData map.
  class OpsItemDataValue
    include JSON::Serializable

    # The value of the OperationalData key.
    @[JSON::Field(key: "Value")]
    property value : String | Nil

    # The type of key-value pair. Valid types include `SearchableString` and `String`.
    @[JSON::Field(key: "Type", converter: AS::OpsItemDataType)]
    property type : OpsItemDataType | Nil

    def initialize(
      @value : String | Nil = nil,
      @type : OpsItemDataType | Nil = nil,
    )
    end

    def_equals_and_hash(@value, @type)
  end
end
