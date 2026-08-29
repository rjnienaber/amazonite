module Amazonite::SsmV1
  class NodeOwnerInfo
    include JSON::Serializable

    @[JSON::Field(key: "AccountId")]
    property account_id : String | Nil

    @[JSON::Field(key: "OrganizationalUnitId")]
    property organizational_unit_id : String | Nil

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
