module Amazonite::LambdaV1
  class GetCodeSigningConfigResponse
    include JSON::Serializable

    @[JSON::Field(key: "CodeSigningConfig")]
    property code_signing_config : CodeSigningConfig

    def initialize(
      @code_signing_config : CodeSigningConfig,
    )
    end
  end
end
