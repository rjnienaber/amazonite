private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class ExecuteStatementInput
    include JSON::Serializable

    # The PartiQL statement representing the operation to run.
    @[JSON::Field(key: "Statement")]
    property statement : String

    # The parameters for the PartiQL statement, if any.
    @[JSON::Field(key: "Parameters")]
    property parameters : Array(AttributeValue) | Nil

    # The consistency of a read operation. If set to `true`, then a strongly consistent read is used;
    # otherwise, an eventually consistent read is used.
    @[JSON::Field(key: "ConsistentRead")]
    property consistent_read : Bool | Nil

    # Set this value to get remaining results, if `NextToken` was returned in the statement response.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    # The maximum number of items to evaluate (not necessarily the number of matching items). If
    # DynamoDB processes the number of items up to the limit while processing the results, it stops
    # the operation and returns the matching values up to that point, along with a key in
    # `LastEvaluatedKey` to apply in a subsequent operation so you can pick up where you left off.
    # Also, if the processed dataset size exceeds 1 MB before DynamoDB reaches this limit, it stops
    # the operation and returns the matching values up to the limit, and a key in `LastEvaluatedKey`
    # to apply in a subsequent operation to continue the operation.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # An optional parameter that returns the item attributes for an `ExecuteStatement` operation that
    # failed a condition check.
    #
    # There is no additional cost associated with requesting a return value aside from the small
    # network and processing overhead of receiving a larger response. No read capacity units are
    # consumed.
    @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure", converter: ADDB::ReturnValuesOnConditionCheckFailure)]
    property return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil

    def initialize(
      @statement : String,
      @parameters : Array(AttributeValue) | Nil = nil,
      @consistent_read : Bool | Nil = nil,
      @next_token : String | Nil = nil,
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
      @limit : Int32 | Nil = nil,
      @return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @statement
        raise Core::ValidationError.new("Statement length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Statement length must be <= 8192") if value.size > 8192
      end

      if value = @parameters
        raise Core::ValidationError.new("Parameters must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 32768") if value.size > 32768
      end

      if value = @limit
        raise Core::ValidationError.new("Limit value must be >= 1") if value < 1
      end
    end

    def_equals_and_hash(@statement, @parameters, @consistent_read, @next_token, @return_consumed_capacity, @limit, @return_values_on_condition_check_failure)
  end
end
