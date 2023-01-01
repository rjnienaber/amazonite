module Amazonite::SsmV1
  class OpsMetadataFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key")]
    property key : String

    @[JSON::Field(key: "Values")]
    property values : Array(String)

    def initialize(
      @key : String,
      @values : Array(String)
    )
    end
  end
end
