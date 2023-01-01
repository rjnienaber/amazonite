private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class DocumentParameter
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "Type", converter: AS::DocumentParameterType)]
    property type : DocumentParameterType | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "DefaultValue")]
    property default_value : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @type : DocumentParameterType | Nil = nil,
      @description : String | Nil = nil,
      @default_value : String | Nil = nil
    )
    end
  end
end
