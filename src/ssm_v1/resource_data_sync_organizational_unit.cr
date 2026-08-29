module Amazonite::SsmV1
  # The Organizations organizational unit data source for the sync.
  class ResourceDataSyncOrganizationalUnit
    include JSON::Serializable

    # The Organizations unit ID data source for the sync.
    @[JSON::Field(key: "OrganizationalUnitId")]
    property organizational_unit_id : String | Nil

    def initialize(
      @organizational_unit_id : String | Nil = nil,
    )
    end
  end
end
