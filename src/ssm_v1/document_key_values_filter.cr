module Amazonite::SsmV1
  class DocumentKeyValuesFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key")]
    property key : String | Nil

    @[JSON::Field(key: "Values")]
    property values : Array(String) | Nil

    def initialize(
      @key : String | Nil = nil,
      @values : Array(String) | Nil = nil
    )
    end
  end
end
