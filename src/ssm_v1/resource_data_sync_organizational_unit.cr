module Amazonite::SsmV1
  class ResourceDataSyncOrganizationalUnit
    include JSON::Serializable

    @[JSON::Field(key: "OrganizationalUnitId")]
    property organizational_unit_id : String | Nil

    def initialize(
      @organizational_unit_id : String | Nil = nil
    )
    end
  end
end
