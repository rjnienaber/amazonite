module Amazonite::SsmV1
  class GetInventorySchemaRequest
    include JSON::Serializable

    @[JSON::Field(key: "TypeName")]
    property type_name : String | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "Aggregator")]
    property aggregator : Bool | Nil

    @[JSON::Field(key: "SubType")]
    property sub_type : Bool | Nil

    def initialize(
      @type_name : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @aggregator : Bool | Nil = nil,
      @sub_type : Bool | Nil = nil
    )
    end
  end
end
