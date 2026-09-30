private alias Core = Amazonite::Core

module Amazonite::Lambda
  class ListCodeSigningConfigsResponse
    include JSON::Serializable

    # The pagination token that's included if more results are available.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    # The code signing configurations
    @[JSON::Field(key: "CodeSigningConfigs")]
    property code_signing_configs : Array(CodeSigningConfig) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @code_signing_configs : Array(CodeSigningConfig) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @code_signing_configs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_marker, @code_signing_configs)
  end
end
