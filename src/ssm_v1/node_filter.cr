private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # The filters for the operation.
  class NodeFilter
    include JSON::Serializable

    # The name of the filter.
    @[JSON::Field(key: "Key", converter: AS::NodeFilterKey)]
    property key : NodeFilterKey

    # A filter value supported by the specified key. For example, for the key `PlatformType`,
    # supported values include `Linux` and `Windows`.
    @[JSON::Field(key: "Values")]
    property values : Array(String) = [] of String

    # The type of filter operator.
    @[JSON::Field(key: "Type", converter: AS::NodeFilterOperatorType)]
    property type : NodeFilterOperatorType | Nil

    def initialize(
      @key : NodeFilterKey,
      @values : Array(String),
      @type : NodeFilterOperatorType | Nil = nil,
    )
    end

    def_equals_and_hash(@key, @values, @type)
  end
end
