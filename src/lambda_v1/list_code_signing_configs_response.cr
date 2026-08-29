module Amazonite::LambdaV1
  class ListCodeSigningConfigsResponse
    include JSON::Serializable

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    @[JSON::Field(key: "CodeSigningConfigs")]
    property code_signing_configs : Array(CodeSigningConfig) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @code_signing_configs : Array(CodeSigningConfig) | Nil = nil,
    )
    end
  end
end
