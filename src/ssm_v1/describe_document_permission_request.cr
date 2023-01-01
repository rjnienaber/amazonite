private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class DescribeDocumentPermissionRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "PermissionType", converter: AS::DocumentPermissionType)]
    property permission_type : DocumentPermissionType

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @name : String,
      @permission_type : DocumentPermissionType,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
