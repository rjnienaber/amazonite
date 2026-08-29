module Amazonite::LambdaV1
  class CodeSigningConfig
    include JSON::Serializable

    @[JSON::Field(key: "CodeSigningConfigId")]
    property code_signing_config_id : String

    @[JSON::Field(key: "CodeSigningConfigArn")]
    property code_signing_config_arn : String

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "AllowedPublishers")]
    property allowed_publishers : AllowedPublishers

    @[JSON::Field(key: "CodeSigningPolicies")]
    property code_signing_policies : CodeSigningPolicies

    @[JSON::Field(key: "LastModified")]
    property last_modified : String

    def initialize(
      @code_signing_config_id : String,
      @code_signing_config_arn : String,
      @allowed_publishers : AllowedPublishers,
      @code_signing_policies : CodeSigningPolicies,
      @last_modified : String,
      @description : String | Nil = nil,
    )
    end
  end
end
