module Amazonite::SsmV1
  class ListOpsMetadataRequest
    include JSON::Serializable

    @[JSON::Field(key: "Filters")]
    property filters : Array(OpsMetadataFilter) | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @filters : Array(OpsMetadataFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
