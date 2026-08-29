module Amazonite::SsmV1
  # The inventory result item.
  class InventoryResultItem
    include JSON::Serializable

    # The name of the inventory result item type.
    @[JSON::Field(key: "TypeName")]
    property type_name : String

    # The schema version for the inventory result item/
    @[JSON::Field(key: "SchemaVersion")]
    property schema_version : String

    # The time inventory item data was captured.
    @[JSON::Field(key: "CaptureTime")]
    property capture_time : String | Nil

    # MD5 hash of the inventory item type contents. The content hash is used to determine whether to
    # update inventory information. The PutInventory API doesn't update the inventory item type
    # contents if the MD5 hash hasn't changed since last update.
    @[JSON::Field(key: "ContentHash")]
    property content_hash : String | Nil

    # Contains all the inventory data of the item type. Results include attribute names and values.
    @[JSON::Field(key: "Content")]
    property content : Array(Hash(String, String)) = [] of Hash(String, String)

    def initialize(
      @type_name : String,
      @schema_version : String,
      @content : Array(Hash(String, String)),
      @capture_time : String | Nil = nil,
      @content_hash : String | Nil = nil,
    )
    end
  end
end
