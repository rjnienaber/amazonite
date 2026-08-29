module Amazonite::SsmV1
  class ListNodesRequest
    include JSON::Serializable

    @[JSON::Field(key: "SyncName")]
    property sync_name : String | Nil

    @[JSON::Field(key: "Filters")]
    property filters : Array(NodeFilter) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @sync_name : String | Nil = nil,
      @filters : Array(NodeFilter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end
  end
end
