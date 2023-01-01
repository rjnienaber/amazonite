module Amazonite::SsmV1
  class ListInventoryEntriesResult
    include JSON::Serializable

    @[JSON::Field(key: "TypeName")]
    property type_name : String | Nil

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    @[JSON::Field(key: "SchemaVersion")]
    property schema_version : String | Nil

    @[JSON::Field(key: "CaptureTime")]
    property capture_time : String | Nil

    @[JSON::Field(key: "Entries")]
    property entries : Array(Hash(String, String)) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @type_name : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @schema_version : String | Nil = nil,
      @capture_time : String | Nil = nil,
      @entries : Array(Hash(String, String)) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
