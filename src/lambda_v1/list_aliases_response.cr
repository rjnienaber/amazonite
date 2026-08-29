module Amazonite::LambdaV1
  class ListAliasesResponse
    include JSON::Serializable

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    @[JSON::Field(key: "Aliases")]
    property aliases : Array(AliasConfiguration) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @aliases : Array(AliasConfiguration) | Nil = nil,
    )
    end
  end
end
