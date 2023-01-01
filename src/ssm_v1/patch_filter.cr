private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class PatchFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key", converter: AS::PatchFilterKey)]
    property key : PatchFilterKey

    @[JSON::Field(key: "Values")]
    property values : Array(String)

    def initialize(
      @key : PatchFilterKey,
      @values : Array(String)
    )
    end
  end
end
