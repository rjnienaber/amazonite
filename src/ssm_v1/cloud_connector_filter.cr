private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class CloudConnectorFilter
    include JSON::Serializable

    @[JSON::Field(key: "FilterKey", converter: AS::CloudConnectorFilterKey)]
    property filter_key : CloudConnectorFilterKey | Nil

    @[JSON::Field(key: "FilterValues")]
    property filter_values : Array(String) | Nil

    def initialize(
      @filter_key : CloudConnectorFilterKey | Nil = nil,
      @filter_values : Array(String) | Nil = nil,
    )
    end
  end
end
