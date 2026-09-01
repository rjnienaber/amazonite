private alias Core = Amazonite::Core

module Amazonite::Ssm
  class StartAssociationsOnceRequest
    include JSON::Serializable

    # The association IDs that you want to run immediately and only one time.
    @[JSON::Field(key: "AssociationIds")]
    property association_ids : Array(String) = [] of String

    def initialize(
      @association_ids : Array(String),
    )
    end

    def validate! : Nil
      if value = @association_ids
        raise Core::ValidationError.new("AssociationIds must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("AssociationIds must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@association_ids)
  end
end
