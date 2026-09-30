private alias Core = Amazonite::Core

module Amazonite::Lambda
  class CreateCodeSigningConfigResponse
    include JSON::Serializable

    # The code signing configuration.
    @[JSON::Field(key: "CodeSigningConfig")]
    property code_signing_config : CodeSigningConfig

    def initialize(
      @code_signing_config : CodeSigningConfig,
    )
    end

    def validate! : Nil
      if value = @code_signing_config
        value.validate!
      end
    end

    def_equals_and_hash(@code_signing_config)
  end
end
