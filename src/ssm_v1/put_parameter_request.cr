private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class PutParameterRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "Value")]
    property value : String

    @[JSON::Field(key: "Type", converter: AS::ParameterType)]
    property type : ParameterType | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "Overwrite")]
    property overwrite : Bool | Nil

    @[JSON::Field(key: "AllowedPattern")]
    property allowed_pattern : String | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    @[JSON::Field(key: "Tier", converter: AS::ParameterTier)]
    property tier : ParameterTier | Nil

    @[JSON::Field(key: "Policies")]
    property policies : String | Nil

    @[JSON::Field(key: "DataType")]
    property data_type : String | Nil

    def initialize(
      @name : String,
      @value : String,
      @description : String | Nil = nil,
      @type : ParameterType | Nil = nil,
      @key_id : String | Nil = nil,
      @overwrite : Bool | Nil = nil,
      @allowed_pattern : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @tier : ParameterTier | Nil = nil,
      @policies : String | Nil = nil,
      @data_type : String | Nil = nil
    )
    end
  end
end
