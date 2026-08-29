module Amazonite::LambdaV1
  class DeleteCodeSigningConfigRequest
    include JSON::Serializable

    # The The Amazon Resource Name (ARN) of the code signing configuration.
    @[JSON::Field(key: "CodeSigningConfigArn", ignore: true)]
    property code_signing_config_arn : String = ""

    def initialize(
      @code_signing_config_arn : String,
    )
    end
  end
end
