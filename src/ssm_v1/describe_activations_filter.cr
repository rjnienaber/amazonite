private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class DescribeActivationsFilter
    include JSON::Serializable

    @[JSON::Field(key: "FilterKey", converter: AS::DescribeActivationsFilterKeys)]
    property filter_key : DescribeActivationsFilterKeys | Nil

    @[JSON::Field(key: "FilterValues")]
    property filter_values : Array(String) | Nil

    def initialize(
      @filter_key : DescribeActivationsFilterKeys | Nil = nil,
      @filter_values : Array(String) | Nil = nil
    )
    end
  end
end
