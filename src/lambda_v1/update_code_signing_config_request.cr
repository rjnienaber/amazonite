module Amazonite::LambdaV1
  class UpdateCodeSigningConfigRequest
    include JSON::Serializable

    # The The Amazon Resource Name (ARN) of the code signing configuration.
    @[JSON::Field(key: "CodeSigningConfigArn", ignore: true)]
    property code_signing_config_arn : String = ""

    # Descriptive name for this code signing configuration.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # Signing profiles for this code signing configuration.
    @[JSON::Field(key: "AllowedPublishers")]
    property allowed_publishers : AllowedPublishers | Nil

    # The code signing policy.
    @[JSON::Field(key: "CodeSigningPolicies")]
    property code_signing_policies : CodeSigningPolicies | Nil

    def initialize(
      @code_signing_config_arn : String,
      @description : String | Nil = nil,
      @allowed_publishers : AllowedPublishers | Nil = nil,
      @code_signing_policies : CodeSigningPolicies | Nil = nil,
    )
    end

    def_equals_and_hash(@code_signing_config_arn, @description, @allowed_publishers, @code_signing_policies)
  end
end
