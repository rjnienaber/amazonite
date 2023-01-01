module Amazonite::SsmV1
  class StartAssociationsOnceRequest
    include JSON::Serializable

    @[JSON::Field(key: "AssociationIds")]
    property association_ids : Array(String)

    def initialize(
      @association_ids : Array(String)
    )
    end
  end
end
