private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Contains the filter criteria used to limit which items are included in an export. If you don't
  # include this parameter, all items and attributes are exported.
  class FilterSpecification
    include JSON::Serializable

    # A condition that filters which items are included in the export. This parameter uses the same
    # syntax as `FilterExpression` in `Query` and `Scan`. If you don't provide
    # `KeyConditionExpression`, this expression can also reference key attributes. If you don't
    # specify this parameter, all items are included in the export.
    @[JSON::Field(key: "FilterExpression")]
    property filter_expression : String | Nil

    # The attributes you want to retrieve for items included in the export. Separate attribute names
    # in the expression with commas. If you don't specify this parameter, all attributes are returned.
    @[JSON::Field(key: "ProjectionExpression")]
    property projection_expression : String | Nil

    # A condition expression that filters items by key values. The expression must test equality on a
    # single partition key value and can optionally compare a sort key value. This parameter uses the
    # same syntax as `KeyConditionExpression` in `Query`. When you provide this parameter,
    # `FilterExpression` can only reference non-key attributes. If you don't specify this parameter,
    # all items are eligible for export.
    @[JSON::Field(key: "KeyConditionExpression")]
    property key_condition_expression : String | Nil

    # One or more substitution tokens for attribute names in an expression. For more information, see
    # [Expression Attribute
    # Names](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ExpressionAttributeNames.html)
    # in the Amazon DynamoDB Developer Guide.
    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    # One or more values that can be substituted in an expression. For more information, see
    # [Expression Attribute
    # Values](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ExpressionAttributeValues.html)
    # in the Amazon DynamoDB Developer Guide.
    @[JSON::Field(key: "ExpressionAttributeValues")]
    property expression_attribute_values : Hash(String, AttributeValue) | Nil

    def initialize(
      @filter_expression : String | Nil = nil,
      @projection_expression : String | Nil = nil,
      @key_condition_expression : String | Nil = nil,
      @expression_attribute_names : Hash(String, String) | Nil = nil,
      @expression_attribute_values : Hash(String, AttributeValue) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @expression_attribute_values
        value.each_value(&.validate!)
      end
    end

    def_equals_and_hash(@filter_expression, @projection_expression, @key_condition_expression, @expression_attribute_names, @expression_attribute_values)
  end
end
