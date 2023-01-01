module Amazonite::SsmV1
  class ListOpsItemEventsRequest
    include JSON::Serializable

    @[JSON::Field(key: "Filters")]
    property filters : Array(OpsItemEventFilter) | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @filters : Array(OpsItemEventFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
