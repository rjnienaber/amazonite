module Amazonite::SsmV1
  class ResourceDataSyncAwsOrganizationsSource
    include JSON::Serializable

    @[JSON::Field(key: "OrganizationSourceType")]
    property organization_source_type : String

    @[JSON::Field(key: "OrganizationalUnits")]
    property organizational_units : Array(ResourceDataSyncOrganizationalUnit) | Nil

    def initialize(
      @organization_source_type : String,
      @organizational_units : Array(ResourceDataSyncOrganizationalUnit) | Nil = nil
    )
    end
  end
end
