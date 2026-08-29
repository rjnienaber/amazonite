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
  end
end
