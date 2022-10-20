private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class ExpectedAttributeValue
    include JSON::Serializable

    @[JSON::Field(key: "Value")]
    property value : AttributeValue | Nil

    @[JSON::Field(key: "Exists")]
    property exists : Bool | Nil

    @[JSON::Field(key: "ComparisonOperator", converter: ADDB::ComparisonOperator)]
    property comparison_operator : ComparisonOperator | Nil

    @[JSON::Field(key: "AttributeValueList")]
    property attribute_value_list : Array(AttributeValue) | Nil

    def initialize(
      @value : AttributeValue | Nil = nil,
      @exists : Bool | Nil = nil,
      @comparison_operator : ComparisonOperator | Nil = nil,
      @attribute_value_list : Array(AttributeValue) | Nil = nil
    )
    end
  end
end
