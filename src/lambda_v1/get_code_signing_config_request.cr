module Amazonite::LambdaV1
  class GetCodeSigningConfigRequest
    include JSON::Serializable

    @[JSON::Field(key: "CodeSigningConfigArn", ignore: true)]
    property code_signing_config_arn : String = ""

    def initialize(
      @code_signing_config_arn : String,
    )
    end
  end
end
