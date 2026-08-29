module Amazonite::LambdaV1
  class CreateCodeSigningConfigRequest
    include JSON::Serializable

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "AllowedPublishers")]
    property allowed_publishers : AllowedPublishers

    @[JSON::Field(key: "CodeSigningPolicies")]
    property code_signing_policies : CodeSigningPolicies | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @allowed_publishers : AllowedPublishers,
      @description : String | Nil = nil,
      @code_signing_policies : CodeSigningPolicies | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end
  end
end
