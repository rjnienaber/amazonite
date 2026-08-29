module Amazonite::SsmV1
  # A filter to limit the number of OpsMetadata objects displayed.
  class OpsMetadataFilter
    include JSON::Serializable

    # A filter key.
    @[JSON::Field(key: "Key")]
    property key : String

    # A filter value.
    @[JSON::Field(key: "Values")]
    property values : Array(String) = [] of String

    def initialize(
      @key : String,
      @values : Array(String),
    )
    end
  end
end
