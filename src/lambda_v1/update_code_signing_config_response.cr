module Amazonite::LambdaV1
  class UpdateCodeSigningConfigResponse
    include JSON::Serializable

    # The code signing configuration
    @[JSON::Field(key: "CodeSigningConfig")]
    property code_signing_config : CodeSigningConfig

    def initialize(
      @code_signing_config : CodeSigningConfig,
    )
    end

    def_equals_and_hash(@code_signing_config)
  end
end
