module Amazonite::SsmV1
  class ListNodesSummaryResult
    include JSON::Serializable

    @[JSON::Field(key: "Summary")]
    property summary : Array(Hash(String, String)) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @summary : Array(Hash(String, String)) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
