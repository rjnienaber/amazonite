module Amazonite::LambdaV1
  class UpdateCodeSigningConfigRequest
    include JSON::Serializable

    @[JSON::Field(key: "CodeSigningConfigArn", ignore: true)]
    property code_signing_config_arn : String = ""

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "AllowedPublishers")]
    property allowed_publishers : AllowedPublishers | Nil

    @[JSON::Field(key: "CodeSigningPolicies")]
    property code_signing_policies : CodeSigningPolicies | Nil

    def initialize(
      @code_signing_config_arn : String,
      @description : String | Nil = nil,
      @allowed_publishers : AllowedPublishers | Nil = nil,
      @code_signing_policies : CodeSigningPolicies | Nil = nil,
    )
    end
  end
end
