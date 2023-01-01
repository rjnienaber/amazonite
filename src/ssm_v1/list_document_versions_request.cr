module Amazonite::SsmV1
  class ListDocumentVersionsRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @name : String,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
