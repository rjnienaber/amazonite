private alias Core = Amazonite::Core

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

    def validate! : Nil
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
    end

    def_equals_and_hash(@code_signing_config_arn, @description, @allowed_publishers, @code_signing_policies)
  end
end
