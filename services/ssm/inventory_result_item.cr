private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TypeName length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("TypeName does not match the required pattern") unless value.matches?(Regex.new("^(AWS|Custom):.*$"))
      end

      if value = @schema_version
        raise Core::ValidationError.new("SchemaVersion does not match the required pattern") unless value.matches?(Regex.new("^([0-9]{1,6})(\\.[0-9]{1,6})$"))
      end

      if value = @capture_time
        raise Core::ValidationError.new("CaptureTime does not match the required pattern") unless value.matches?(Regex.new("^(20)[0-9][0-9]-(0[1-9]|1[012])-([12][0-9]|3[01]|0[1-9])(T)(2[0-3]|[0-1][0-9])(:[0-5][0-9])(:[0-5][0-9])(Z)$"))
      end

      if value = @content_hash
        raise Core::ValidationError.new("ContentHash length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ContentHash length must be <= 256") if value.size > 256
      end

      if value = @content
        raise Core::ValidationError.new("Content must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Content must have at most 10000 item(s)") if value.size > 10000
      end
    end

    def_equals_and_hash(@type_name, @schema_version, @capture_time, @content_hash, @content)
  end
end
