module Amazonite::SsmV1
  # Information collected from managed nodes based on your inventory policy document
  class InventoryItem
    include JSON::Serializable

    # The name of the inventory type. Default inventory item type names start with `AWS`. Custom
    # inventory type names will start with Custom. Default inventory item types include the following:
    # `AWS:AWSComponent`, `AWS:Application`, `AWS:InstanceInformation`, `AWS:Network`, and
    # `AWS:WindowsUpdate`.
    @[JSON::Field(key: "TypeName")]
    property type_name : String

    # The schema version for the inventory item.
    @[JSON::Field(key: "SchemaVersion")]
    property schema_version : String

    # The time the inventory information was collected.
    @[JSON::Field(key: "CaptureTime")]
    property capture_time : String

    # MD5 hash of the inventory item type contents. The content hash is used to determine whether to
    # update inventory information. The PutInventory API doesn't update the inventory item type
    # contents if the MD5 hash hasn't changed since last update.
    @[JSON::Field(key: "ContentHash")]
    property content_hash : String | Nil

    # The inventory data of the inventory type.
    @[JSON::Field(key: "Content")]
    property content : Array(Hash(String, String)) | Nil

    # A map of associated properties for a specified inventory type. For example, with this attribute,
    # you can specify the `ExecutionId`, `ExecutionType`, `ComplianceType` properties of the
    # `AWS:ComplianceItem` type.
    @[JSON::Field(key: "Context")]
    property context : Hash(String, String) | Nil

    def initialize(
      @type_name : String,
      @schema_version : String,
      @capture_time : String,
      @content_hash : String | Nil = nil,
      @content : Array(Hash(String, String)) | Nil = nil,
      @context : Hash(String, String) | Nil = nil,
    )
    end
  end
end
