private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class ListAliasesResponse
    include JSON::Serializable

    # The pagination token that's included if more results are available.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    # A list of aliases.
    @[JSON::Field(key: "Aliases")]
    property aliases : Array(AliasConfiguration) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @aliases : Array(AliasConfiguration) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @aliases
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_marker, @aliases)
  end
end
