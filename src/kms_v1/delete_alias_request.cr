module Amazonite::KmsV1
  class DeleteAliasRequest
    include JSON::Serializable

    @[JSON::Field(key: "AliasName")]
    property alias_name : String

    def initialize(
      @alias_name : String,
    )
    end
  end
end
