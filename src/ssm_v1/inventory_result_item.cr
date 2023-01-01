module Amazonite::SsmV1
  class InventoryResultItem
    include JSON::Serializable

    @[JSON::Field(key: "TypeName")]
    property type_name : String

    @[JSON::Field(key: "SchemaVersion")]
    property schema_version : String

    @[JSON::Field(key: "CaptureTime")]
    property capture_time : String | Nil

    @[JSON::Field(key: "ContentHash")]
    property content_hash : String | Nil

    @[JSON::Field(key: "Content")]
    property content : Array(Hash(String, String))

    def initialize(
      @type_name : String,
      @schema_version : String,
      @content : Array(Hash(String, String)),
      @capture_time : String | Nil = nil,
      @content_hash : String | Nil = nil
    )
    end
  end
end
