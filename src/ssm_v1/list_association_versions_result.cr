module Amazonite::SsmV1
  class ListAssociationVersionsResult
    include JSON::Serializable

    @[JSON::Field(key: "AssociationVersions")]
    property association_versions : Array(AssociationVersionInfo) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @association_versions : Array(AssociationVersionInfo) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
