private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class OpsItemDataValue
    include JSON::Serializable

    @[JSON::Field(key: "Value")]
    property value : String | Nil

    @[JSON::Field(key: "Type", converter: AS::OpsItemDataType)]
    property type : OpsItemDataType | Nil

    def initialize(
      @value : String | Nil = nil,
      @type : OpsItemDataType | Nil = nil
    )
    end
  end
end
