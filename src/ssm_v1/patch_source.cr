module Amazonite::SsmV1
  class PatchSource
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "Products")]
    property products : Array(String)

    @[JSON::Field(key: "Configuration")]
    property configuration : String

    def initialize(
      @name : String,
      @products : Array(String),
      @configuration : String
    )
    end
  end
end
