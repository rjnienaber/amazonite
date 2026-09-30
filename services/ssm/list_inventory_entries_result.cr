private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TypeName length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("TypeName does not match the required pattern") unless value.matches?(Regex.new("^(AWS|Custom):.*$"))
      end

      if value = @instance_id
        raise Core::ValidationError.new("InstanceId does not match the required pattern") unless value.matches?(Regex.new("^(^i-(\\w{8}|\\w{17})$)|(^mi-\\w{17}$)$"))
      end

      if value = @schema_version
        raise Core::ValidationError.new("SchemaVersion does not match the required pattern") unless value.matches?(Regex.new("^([0-9]{1,6})(\\.[0-9]{1,6})$"))
      end

      if value = @capture_time
        raise Core::ValidationError.new("CaptureTime does not match the required pattern") unless value.matches?(Regex.new("^(20)[0-9][0-9]-(0[1-9]|1[012])-([12][0-9]|3[01]|0[1-9])(T)(2[0-3]|[0-1][0-9])(:[0-5][0-9])(:[0-5][0-9])(Z)$"))
      end

      if value = @entries
        raise Core::ValidationError.new("Entries must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Entries must have at most 10000 item(s)") if value.size > 10000
      end
    end

    def_equals_and_hash(@type_name, @instance_id, @schema_version, @capture_time, @entries, @next_token)
  end
end
