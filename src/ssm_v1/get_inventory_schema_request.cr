private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetInventorySchemaRequest
    include JSON::Serializable

    # The type of inventory item to return.
    @[JSON::Field(key: "TypeName")]
    property type_name : String | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # Returns inventory schemas that support aggregation. For example, this call returns the
    # `AWS:InstanceInformation` type, because it supports aggregation based on the `PlatformName`,
    # `PlatformType`, and `PlatformVersion` attributes.
    @[JSON::Field(key: "Aggregator")]
    property aggregator : Bool | Nil

    # Returns the sub-type schema for a specified inventory type.
    @[JSON::Field(key: "SubType")]
    property sub_type : Bool | Nil

    def initialize(
      @type_name : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @aggregator : Bool | Nil = nil,
      @sub_type : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("TypeName length must be <= 100") if value.size > 100
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 50") if value < 50
        raise Core::ValidationError.new("MaxResults value must be <= 200") if value > 200
      end
    end

    def_equals_and_hash(@type_name, @next_token, @max_results, @aggregator, @sub_type)
  end
end
