private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Information about the `AwsOrganizationsSource` resource data sync source. A sync source of this
  # type can synchronize data from Organizations or, if an Amazon Web Services organization isn't
  # present, from multiple Amazon Web Services Regions.
  class ResourceDataSyncAwsOrganizationsSource
    include JSON::Serializable

    # If an Amazon Web Services organization is present, this is either `OrganizationalUnits` or
    # `EntireOrganization`. For `OrganizationalUnits`, the data is aggregated from a set of
    # organization units. For `EntireOrganization`, the data is aggregated from the entire Amazon Web
    # Services organization.
    @[JSON::Field(key: "OrganizationSourceType")]
    property organization_source_type : String

    # The Organizations organization units included in the sync.
    @[JSON::Field(key: "OrganizationalUnits")]
    property organizational_units : Array(ResourceDataSyncOrganizationalUnit) | Nil

    def initialize(
      @organization_source_type : String,
      @organizational_units : Array(ResourceDataSyncOrganizationalUnit) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @organization_source_type
        raise Core::ValidationError.new("OrganizationSourceType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OrganizationSourceType length must be <= 64") if value.size > 64
      end

      if value = @organizational_units
        raise Core::ValidationError.new("OrganizationalUnits must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("OrganizationalUnits must have at most 1000 item(s)") if value.size > 1000
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@organization_source_type, @organizational_units)
  end
end
