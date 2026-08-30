private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Information about ownership of a managed node.
  class NodeOwnerInfo
    include JSON::Serializable

    # The ID of the Amazon Web Services account that owns the managed node.
    @[JSON::Field(key: "AccountId")]
    property account_id : String | Nil

    # The ID of the organization unit (OU) that the account is part of.
    @[JSON::Field(key: "OrganizationalUnitId")]
    property organizational_unit_id : String | Nil

    # The path for the organizational unit (OU) that owns the managed node. The path for the OU is
    # built using the IDs of the organization, root, and all OUs in the path down to and including the
    # OU. For example:
    #
    # `o-a1b2c3d4e5/r-f6g7h8i9j0example/ou-ghi0-awsccccc/ou-jkl0-awsddddd/`
    @[JSON::Field(key: "OrganizationalUnitPath")]
    property organizational_unit_path : String | Nil

    def initialize(
      @account_id : String | Nil = nil,
      @organizational_unit_id : String | Nil = nil,
      @organizational_unit_path : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @account_id
        raise Core::ValidationError.new("AccountId does not match the required pattern") unless value.matches?(Regex.new("^[0-9]{12}$"))
      end

      if value = @organizational_unit_id
        raise Core::ValidationError.new("OrganizationalUnitId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OrganizationalUnitId length must be <= 68") if value.size > 68
        raise Core::ValidationError.new("OrganizationalUnitId does not match the required pattern") unless value.matches?(Regex.new("^ou-[0-9a-z]{4,32}-[a-z0-9]{8,32}$"))
      end

      if value = @organizational_unit_path
        raise Core::ValidationError.new("OrganizationalUnitPath length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OrganizationalUnitPath length must be <= 512") if value.size > 512
      end
    end

    def_equals_and_hash(@account_id, @organizational_unit_id, @organizational_unit_path)
  end
end
