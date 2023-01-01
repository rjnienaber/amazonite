private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class ParameterMetadata
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "Type", converter: AS::ParameterType)]
    property type : ParameterType | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "LastModifiedDate", converter: Core::AWSEpochConverter)]
    property last_modified_date : Time | Nil

    @[JSON::Field(key: "LastModifiedUser")]
    property last_modified_user : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "AllowedPattern")]
    property allowed_pattern : String | Nil

    @[JSON::Field(key: "Version")]
    property version : Int64 | Nil

    @[JSON::Field(key: "Tier", converter: AS::ParameterTier)]
    property tier : ParameterTier | Nil

    @[JSON::Field(key: "Policies")]
    property policies : Array(ParameterInlinePolicy) | Nil

    @[JSON::Field(key: "DataType")]
    property data_type : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @type : ParameterType | Nil = nil,
      @key_id : String | Nil = nil,
      @last_modified_date : Time | Nil = nil,
      @last_modified_user : String | Nil = nil,
      @description : String | Nil = nil,
      @allowed_pattern : String | Nil = nil,
      @version : Int64 | Nil = nil,
      @tier : ParameterTier | Nil = nil,
      @policies : Array(ParameterInlinePolicy) | Nil = nil,
      @data_type : String | Nil = nil
    )
    end
  end
end
