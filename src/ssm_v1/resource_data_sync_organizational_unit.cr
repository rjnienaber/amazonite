private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @organizational_unit_id
        raise Core::ValidationError.new("OrganizationalUnitId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OrganizationalUnitId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("OrganizationalUnitId does not match the required pattern") unless value.matches?(Regex.new("^ou-[0-9a-z]{4,32}-[a-z0-9]{8,32}$"))
      end
    end

    def_equals_and_hash(@organizational_unit_id)
  end
end
