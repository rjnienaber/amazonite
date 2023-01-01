module Amazonite::SsmV1
  class ParameterStringFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key")]
    property key : String

    @[JSON::Field(key: "Option")]
    property option : String | Nil

    @[JSON::Field(key: "Values")]
    property values : Array(String) | Nil

    def initialize(
      @key : String,
      @option : String | Nil = nil,
      @values : Array(String) | Nil = nil
    )
    end
  end
end
