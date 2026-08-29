module Amazonite::SsmV1
  class ListInventoryEntriesResult
    include JSON::Serializable

    # The type of inventory item returned by the request.
    @[JSON::Field(key: "TypeName")]
    property type_name : String | Nil

    # The managed node ID targeted by the request to query inventory information.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    # The inventory schema version used by the managed nodes.
    @[JSON::Field(key: "SchemaVersion")]
    property schema_version : String | Nil

    # The time that inventory information was collected for the managed nodes.
    @[JSON::Field(key: "CaptureTime")]
    property capture_time : String | Nil

    # A list of inventory items on the managed nodes.
    @[JSON::Field(key: "Entries")]
    property entries : Array(Hash(String, String)) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @type_name : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @schema_version : String | Nil = nil,
      @capture_time : String | Nil = nil,
      @entries : Array(Hash(String, String)) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
