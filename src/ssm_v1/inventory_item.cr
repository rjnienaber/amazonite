module Amazonite::SsmV1
  class InventoryItem
    include JSON::Serializable

    @[JSON::Field(key: "TypeName")]
    property type_name : String

    @[JSON::Field(key: "SchemaVersion")]
    property schema_version : String

    @[JSON::Field(key: "CaptureTime")]
    property capture_time : String

    @[JSON::Field(key: "ContentHash")]
    property content_hash : String | Nil

    @[JSON::Field(key: "Content")]
    property content : Array(Hash(String, String)) | Nil

    @[JSON::Field(key: "Context")]
    property context : Hash(String, String) | Nil

    def initialize(
      @type_name : String,
      @schema_version : String,
      @capture_time : String,
      @content_hash : String | Nil = nil,
      @content : Array(Hash(String, String)) | Nil = nil,
      @context : Hash(String, String) | Nil = nil
    )
    end
  end
end
