private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  # Filter for the DescribeActivation API.
  class DescribeActivationsFilter
    include JSON::Serializable

    # The name of the filter.
    @[JSON::Field(key: "FilterKey", converter: AS::DescribeActivationsFilterKeys)]
    property filter_key : DescribeActivationsFilterKeys | Nil

    # The filter values.
    @[JSON::Field(key: "FilterValues")]
    property filter_values : Array(String) | Nil

    def initialize(
      @filter_key : DescribeActivationsFilterKeys | Nil = nil,
      @filter_values : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@filter_key, @filter_values)
  end
end
