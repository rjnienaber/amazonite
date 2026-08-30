module Amazonite::KmsV1
  class DeleteAliasRequest
    include JSON::Serializable

    # The alias to be deleted. The alias name must begin with `alias/` followed by the alias name,
    # such as `alias/ExampleAlias`.
    @[JSON::Field(key: "AliasName")]
    property alias_name : String

    def initialize(
      @alias_name : String,
    )
    end

    def_equals_and_hash(@alias_name)
  end
end
