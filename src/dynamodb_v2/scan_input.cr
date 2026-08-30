private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Represents the input of a `Scan` operation.
  class ScanInput
    include JSON::Serializable

    # The name of the table containing the requested items or if you provide `IndexName`, the name of
    # the table to which that index belongs.
    #
    # You can also provide the Amazon Resource Name (ARN) of the table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # The name of a secondary index to scan. This index can be any local secondary index or global
    # secondary index. Note that if you use the `IndexName` parameter, you must also provide
    # `TableName`.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    # This is a legacy parameter. Use `ProjectionExpression` instead. For more information, see
    # [AttributesToGet](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "AttributesToGet")]
    property attributes_to_get : Array(String) | Nil

    # The maximum number of items to evaluate (not necessarily the number of matching items). If
    # DynamoDB processes the number of items up to the limit while processing the results, it stops
    # the operation and returns the matching values up to that point, and a key in `LastEvaluatedKey`
    # to apply in a subsequent operation, so that you can pick up where you left off. Also, if the
    # processed dataset size exceeds 1 MB before DynamoDB reaches this limit, it stops the operation
    # and returns the matching values up to the limit, and a key in `LastEvaluatedKey` to apply in a
    # subsequent operation to continue the operation. For more information, see [Working with
    # Queries](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html) in
    # the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # The attributes to be returned in the result. You can retrieve all item attributes, specific item
    # attributes, the count of matching items, or in the case of an index, some or all of the
    # attributes projected into the index.
    #
    # - `ALL_ATTRIBUTES` - Returns all of the item attributes from the specified table or index. If
    # you query a local secondary index, then for each matching item in the index, DynamoDB fetches
    # the entire item from the parent table. If the index is configured to project all item
    # attributes, then all of the data can be obtained from the local secondary index, and no fetching
    # is required.
    #
    # - `ALL_PROJECTED_ATTRIBUTES` - Allowed only when querying an index. Retrieves all attributes
    # that have been projected into the index. If the index is configured to project all attributes,
    # this return value is equivalent to specifying `ALL_ATTRIBUTES`.
    #
    # - `COUNT` - Returns the number of matching items, rather than the matching items themselves.
    # Note that this uses the same quantity of read capacity units as getting the items, and is
    # subject to the same item size calculations.
    #
    # - `SPECIFIC_ATTRIBUTES` - Returns only the attributes listed in `ProjectionExpression`. This
    # return value is equivalent to specifying `ProjectionExpression` without specifying any value for
    # `Select`.
    #
    # If you query or scan a local secondary index and request only attributes that are projected into
    # that index, the operation reads only the index and not the table. If any of the requested
    # attributes are not projected into the local secondary index, DynamoDB fetches each of these
    # attributes from the parent table. This extra fetching incurs additional throughput cost and
    # latency.
    #
    # If you query or scan a global secondary index, you can only request attributes that are
    # projected into the index. Global secondary index queries cannot fetch attributes from the parent
    # table.
    #
    # If neither `Select` nor `ProjectionExpression` are specified, DynamoDB defaults to
    # `ALL_ATTRIBUTES` when accessing a table, and `ALL_PROJECTED_ATTRIBUTES` when accessing an index.
    # You cannot use both `Select` and `ProjectionExpression` together in a single request, unless the
    # value for `Select` is `SPECIFIC_ATTRIBUTES`. (This usage is equivalent to specifying
    # `ProjectionExpression` without any value for `Select`.)
    #
    # If you use the `ProjectionExpression` parameter, then the value for `Select` can only be
    # `SPECIFIC_ATTRIBUTES`. Any other value for `Select` will return an error.
    @[JSON::Field(key: "Select", converter: ADDB::Select)]
    property select : Select | Nil

    # This is a legacy parameter. Use `FilterExpression` instead. For more information, see
    # [ScanFilter](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ScanFilter.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ScanFilter")]
    property scan_filter : Hash(String, Condition) | Nil

    # This is a legacy parameter. Use `FilterExpression` instead. For more information, see
    # [ConditionalOperator](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ConditionalOperator", converter: ADDB::ConditionalOperator)]
    property conditional_operator : ConditionalOperator | Nil

    # The primary key of the first item that this operation will evaluate. Use the value that was
    # returned for `LastEvaluatedKey` in the previous operation.
    #
    # The data type for `ExclusiveStartKey` must be String, Number or Binary. No set data types are
    # allowed.
    #
    # In a parallel scan, a `Scan` request that includes `ExclusiveStartKey` must specify the same
    # segment whose previous `Scan` returned the corresponding value of `LastEvaluatedKey`.
    @[JSON::Field(key: "ExclusiveStartKey")]
    property exclusive_start_key : Hash(String, AttributeValue) | Nil

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    # For a parallel `Scan` request, `TotalSegments` represents the total number of segments into
    # which the `Scan` operation will be divided. The value of `TotalSegments` corresponds to the
    # number of application workers that will perform the parallel scan. For example, if you want to
    # use four application threads to scan a table or an index, specify a `TotalSegments` value of 4.
    #
    # The value for `TotalSegments` must be greater than or equal to 1, and less than or equal to
    # 1000000. If you specify a `TotalSegments` value of 1, the `Scan` operation will be sequential
    # rather than parallel.
    #
    # If you specify `TotalSegments`, you must also specify `Segment`.
    @[JSON::Field(key: "TotalSegments")]
    property total_segments : Int32 | Nil

    # For a parallel `Scan` request, `Segment` identifies an individual segment to be scanned by an
    # application worker.
    #
    # Segment IDs are zero-based, so the first segment is always 0. For example, if you want to use
    # four application threads to scan a table or an index, then the first thread specifies a
    # `Segment` value of 0, the second thread specifies 1, and so on.
    #
    # The value of `LastEvaluatedKey` returned from a parallel `Scan` request must be used as
    # `ExclusiveStartKey` with the same segment ID in a subsequent `Scan` operation.
    #
    # The value for `Segment` must be greater than or equal to 0, and less than the value provided for
    # `TotalSegments`.
    #
    # If you provide `Segment`, you must also provide `TotalSegments`.
    @[JSON::Field(key: "Segment")]
    property segment : Int32 | Nil

    # A string that identifies one or more attributes to retrieve from the specified table or index.
    # These attributes can include scalars, sets, or elements of a JSON document. The attributes in
    # the expression must be separated by commas.
    #
    # If no attribute names are specified, then all attributes will be returned. If any of the
    # requested attributes are not found, they will not appear in the result.
    #
    # For more information, see [Specifying Item
    # Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ProjectionExpression")]
    property projection_expression : String | Nil

    # A string that contains conditions that DynamoDB applies after the `Scan` operation, but before
    # the data is returned to you. Items that do not satisfy the `FilterExpression` criteria are not
    # returned.
    #
    # A `FilterExpression` is applied after the items have already been read; the process of filtering
    # does not consume any additional read capacity units.
    #
    # For more information, see [Filter
    # Expressions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.FilterExpression)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "FilterExpression")]
    property filter_expression : String | Nil

    # One or more substitution tokens for attribute names in an expression. The following are some use
    # cases for using `ExpressionAttributeNames`:
    #
    # - To access an attribute whose name conflicts with a DynamoDB reserved word.
    #
    # - To create a placeholder for repeating occurrences of an attribute name in an expression.
    #
    # - To prevent special characters in an attribute name from being misinterpreted in an expression.
    #
    # Use the **#** character in an expression to dereference an attribute name. For example, consider
    # the following attribute name:
    #
    # - `Percentile`
    #
    # The name of this attribute conflicts with a reserved word, so it cannot be used directly in an
    # expression. (For the complete list of reserved words, see [Reserved
    # Words](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html) in
    # the *Amazon DynamoDB Developer Guide*). To work around this, you could specify the following for
    # `ExpressionAttributeNames`:
    #
    # - `{"#P":"Percentile"}`
    #
    # You could then use this substitution in an expression, as in this example:
    #
    # - `#P = :val`
    #
    # Tokens that begin with the **:** character are *expression attribute values*, which are
    # placeholders for the actual value at runtime.
    #
    # For more information on expression attribute names, see [Specifying Item
    # Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    # One or more values that can be substituted in an expression.
    #
    # Use the **:** (colon) character in an expression to dereference an attribute value. For example,
    # suppose that you wanted to check whether the value of the `ProductStatus` attribute was one of
    # the following:
    #
    # `Available | Backordered | Discontinued`
    #
    # You would first need to specify `ExpressionAttributeValues` as follows:
    #
    # `{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} }`
    #
    # You could then use these values in an expression, such as this:
    #
    # `ProductStatus IN (:avail, :back, :disc)`
    #
    # For more information on expression attribute values, see [Condition
    # Expressions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ExpressionAttributeValues")]
    property expression_attribute_values : Hash(String, AttributeValue) | Nil

    # A Boolean value that determines the read consistency model during the scan:
    #
    # - If `ConsistentRead` is `false`, then the data returned from `Scan` might not contain the
    # results from other recently completed write operations (`PutItem`, `UpdateItem`, or
    # `DeleteItem`).
    #
    # - If `ConsistentRead` is `true`, then all of the write operations that completed before the
    # `Scan` began are guaranteed to be contained in the `Scan` response.
    #
    # The default setting for `ConsistentRead` is `false`.
    #
    # The `ConsistentRead` parameter is not supported on global secondary indexes. If you scan a
    # global secondary index with `ConsistentRead` set to true, you will receive a
    # `ValidationException`.
    @[JSON::Field(key: "ConsistentRead")]
    property consistent_read : Bool | Nil

    def initialize(
      @table_name : String,
      @index_name : String | Nil = nil,
      @attributes_to_get : Array(String) | Nil = nil,
      @limit : Int32 | Nil = nil,
      @select : Select | Nil = nil,
      @scan_filter : Hash(String, Condition) | Nil = nil,
      @conditional_operator : ConditionalOperator | Nil = nil,
      @exclusive_start_key : Hash(String, AttributeValue) | Nil = nil,
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
      @total_segments : Int32 | Nil = nil,
      @segment : Int32 | Nil = nil,
      @projection_expression : String | Nil = nil,
      @filter_expression : String | Nil = nil,
      @expression_attribute_names : Hash(String, String) | Nil = nil,
      @expression_attribute_values : Hash(String, AttributeValue) | Nil = nil,
      @consistent_read : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end

      if value = @index_name
        raise Core::ValidationError.new("IndexName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("IndexName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("IndexName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @attributes_to_get
        raise Core::ValidationError.new("AttributesToGet must have at least 1 item(s)") if value.size < 1
      end

      if value = @limit
        raise Core::ValidationError.new("Limit value must be >= 1") if value < 1
      end

      if value = @scan_filter
        value.each_value(&.validate!)
      end

      if value = @exclusive_start_key
        value.each_value(&.validate!)
      end

      if value = @total_segments
        raise Core::ValidationError.new("TotalSegments value must be >= 1") if value < 1
        raise Core::ValidationError.new("TotalSegments value must be <= 1000000") if value > 1000000
      end

      if value = @segment
        raise Core::ValidationError.new("Segment value must be >= 0") if value < 0
        raise Core::ValidationError.new("Segment value must be <= 999999") if value > 999999
      end

      if value = @expression_attribute_values
        value.each_value(&.validate!)
      end
    end

    def_equals_and_hash(@table_name, @index_name, @attributes_to_get, @limit, @select, @scan_filter, @conditional_operator, @exclusive_start_key, @return_consumed_capacity, @total_segments, @segment, @projection_expression, @filter_expression, @expression_attribute_names, @expression_attribute_values, @consistent_read)
  end
end
