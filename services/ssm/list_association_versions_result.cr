private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @association_versions
        raise Core::ValidationError.new("AssociationVersions must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@association_versions, @next_token)
  end
end
