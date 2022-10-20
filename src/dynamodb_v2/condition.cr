private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class Condition
    include JSON::Serializable

    @[JSON::Field(key: "AttributeValueList")]
    property attribute_value_list : Array(AttributeValue) | Nil

    @[JSON::Field(key: "ComparisonOperator", converter: ADDB::ComparisonOperator)]
    property comparison_operator : ComparisonOperator

    def initialize(
      @comparison_operator : ComparisonOperator,
      @attribute_value_list : Array(AttributeValue) | Nil = nil
    )
    end
  end
end