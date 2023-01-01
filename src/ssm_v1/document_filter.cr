private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class DocumentFilter
    include JSON::Serializable

    @[JSON::Field(key: "key", converter: AS::DocumentFilterKey)]
    property key : DocumentFilterKey

    @[JSON::Field(key: "value")]
    property value : String

    def initialize(
      @key : DocumentFilterKey,
      @value : String
    )
    end
  end
end
