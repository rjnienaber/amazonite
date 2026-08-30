module Amazonite::SsmV1
  class ListNodesSummaryResult
    include JSON::Serializable

    # A collection of objects reporting information about your managed nodes, such as the count of
    # nodes by operating system.
    @[JSON::Field(key: "Summary")]
    property summary : Array(Hash(String, String)) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @summary : Array(Hash(String, String)) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
