private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class DescribeDocumentPermissionRequest
    include JSON::Serializable

    # The name of the document for which you are the owner.
    @[JSON::Field(key: "Name")]
    property name : String

    # The permission type for the document. The permission type can be *Share*.
    @[JSON::Field(key: "PermissionType", converter: AS::DocumentPermissionType)]
    property permission_type : DocumentPermissionType

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @name : String,
      @permission_type : DocumentPermissionType,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
