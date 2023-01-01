module Amazonite::SsmV1
  class ListInventoryEntriesRequest
    include JSON::Serializable

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    @[JSON::Field(key: "TypeName")]
    property type_name : String

    @[JSON::Field(key: "Filters")]
    property filters : Array(InventoryFilter) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @instance_id : String,
      @type_name : String,
      @filters : Array(InventoryFilter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil
    )
    end
  end
end
