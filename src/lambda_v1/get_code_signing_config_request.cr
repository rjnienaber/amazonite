module Amazonite::LambdaV1
  class GetCodeSigningConfigRequest
    include JSON::Serializable

    # The The Amazon Resource Name (ARN) of the code signing configuration.
    @[JSON::Field(key: "CodeSigningConfigArn", ignore: true)]
    property code_signing_config_arn : String = ""

    def initialize(
      @code_signing_config_arn : String,
    )
    end

    def_equals_and_hash(@code_signing_config_arn)
  end
end
