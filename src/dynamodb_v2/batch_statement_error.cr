private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # An error associated with a statement in a PartiQL batch that was run.
  class BatchStatementError
    include JSON::Serializable

    # The error code associated with the failed PartiQL batch statement.
    @[JSON::Field(key: "Code", converter: ADDB::BatchStatementErrorCodeEnum)]
    property code : BatchStatementErrorCodeEnum | Nil

    # The error message associated with the PartiQL batch response.
    @[JSON::Field(key: "Message")]
    property message : String | Nil

    # The item which caused the condition check to fail. This will be set if
    # ReturnValuesOnConditionCheckFailure is specified as `ALL_OLD`.
    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue) | Nil

    def initialize(
      @code : BatchStatementErrorCodeEnum | Nil = nil,
      @message : String | Nil = nil,
      @item : Hash(String, AttributeValue) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @item
        value.each_value(&.validate!)
      end
    end

    def_equals_and_hash(@code, @message, @item)
  end
end
