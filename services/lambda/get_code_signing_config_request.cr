private alias Core = Amazonite::Core

module Amazonite::Lambda
  class GetCodeSigningConfigRequest
    include JSON::Serializable

    # The The Amazon Resource Name (ARN) of the code signing configuration.
    @[JSON::Field(key: "CodeSigningConfigArn", ignore: true)]
    property code_signing_config_arn : String = ""

    def initialize(
      @code_signing_config_arn : String,
    )
    end

    def validate! : Nil
      if value = @code_signing_config_arn
        raise Core::ValidationError.new("CodeSigningConfigArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("CodeSigningConfigArn length must be <= 200") if value.size > 200
        raise Core::ValidationError.new("CodeSigningConfigArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:code-signing-config:csc-[a-z0-9]{17}$"))
      end
    end

    def_equals_and_hash(@code_signing_config_arn)
  end
end
