private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @code_signing_config_id
        raise Core::ValidationError.new("CodeSigningConfigId does not match the required pattern") unless value.matches?(Regex.new("^csc-[a-zA-Z0-9-_\\.]{17}$"))
      end

      if value = @code_signing_config_arn
        raise Core::ValidationError.new("CodeSigningConfigArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("CodeSigningConfigArn length must be <= 200") if value.size > 200
        raise Core::ValidationError.new("CodeSigningConfigArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:code-signing-config:csc-[a-z0-9]{17}$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 256") if value.size > 256
      end

      if value = @allowed_publishers
        value.validate!
      end

      if value = @code_signing_policies
        value.validate!
      end

      if value = @last_modified
        raise Core::ValidationError.new("LastModified length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("LastModified length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("LastModified does not match the required pattern") unless value.matches?(Regex.new("^.*$"))
      end
    end

    def_equals_and_hash(@code_signing_config_id, @code_signing_config_arn, @description, @allowed_publishers, @code_signing_policies, @last_modified)
  end
end
