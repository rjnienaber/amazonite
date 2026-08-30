module Amazonite::SsmV1
  class StartAssociationsOnceRequest
    include JSON::Serializable

    # The association IDs that you want to run immediately and only one time.
    @[JSON::Field(key: "AssociationIds")]
    property association_ids : Array(String) = [] of String

    def initialize(
      @association_ids : Array(String),
    )
    end

    def_equals_and_hash(@association_ids)
  end
end
