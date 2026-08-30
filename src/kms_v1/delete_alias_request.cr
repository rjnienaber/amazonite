private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @alias_name
        raise Core::ValidationError.new("AliasName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AliasName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("AliasName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9:/_-]+$"))
      end
    end

    def_equals_and_hash(@alias_name)
  end
end
