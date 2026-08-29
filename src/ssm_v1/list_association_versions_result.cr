module Amazonite::SsmV1
  class ListAssociationVersionsResult
    include JSON::Serializable

    # Information about all versions of the association for the specified association ID.
    @[JSON::Field(key: "AssociationVersions")]
    property association_versions : Array(AssociationVersionInfo) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @association_versions : Array(AssociationVersionInfo) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
