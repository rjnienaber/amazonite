private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @value
        raise Core::ValidationError.new("Value does not match the required pattern") unless value.matches?(Regex.new("^[\\s\\S]*\\S[\\s\\S]*$"))
      end
    end

    def_equals_and_hash(@value, @type)
  end
end
