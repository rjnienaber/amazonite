module Amazonite::LambdaV1
  # Details about a [Code signing
  # configuration](https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html).
  class CodeSigningConfig
    include JSON::Serializable

    # Unique identifer for the Code signing configuration.
    @[JSON::Field(key: "CodeSigningConfigId")]
    property code_signing_config_id : String

    # The Amazon Resource Name (ARN) of the Code signing configuration.
    @[JSON::Field(key: "CodeSigningConfigArn")]
    property code_signing_config_arn : String

    # Code signing configuration description.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # List of allowed publishers.
    @[JSON::Field(key: "AllowedPublishers")]
    property allowed_publishers : AllowedPublishers

    # The code signing policy controls the validation failure action for signature mismatch or expiry.
    @[JSON::Field(key: "CodeSigningPolicies")]
    property code_signing_policies : CodeSigningPolicies

    # The date and time that the Code signing configuration was last modified, in ISO-8601 format
    # (YYYY-MM-DDThh:mm:ss.sTZD).
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
