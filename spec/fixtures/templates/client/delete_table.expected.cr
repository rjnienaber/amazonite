private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class Client < Core::Client
    Log               = ::Log.for("amazonite.dynamodb.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("DynamoDB_20120810", "dynamodb", "1.0", EXCEPTION_FACTORY, config)
    end

    # The `DeleteTable` operation deletes a table and all of its items. After a `DeleteTable` request,
    # the specified table is in the `DELETING` state until DynamoDB completes the deletion. If the
    # table is in the `ACTIVE` state, you can delete it. If a table is in `CREATING` or `UPDATING`
    # states, then DynamoDB returns a `ResourceInUseException`. If the specified table does not exist,
    # DynamoDB returns a `ResourceNotFoundException`. If table is already in the `DELETING` state, no
    # error is returned.
    #
    # DynamoDB might continue to accept data read and write operations, such as `GetItem` and
    # `PutItem`, on a table in the `DELETING` state until the table deletion is complete. For the full
    # list of table states, see
    # [TableStatus](https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_TableDescription.html#DDB-Type-TableDescription-TableStatus).
    #
    # When you delete a table, any indexes on that table are also deleted.
    #
    # If you have DynamoDB Streams enabled on the table, then the corresponding stream on that table
    # goes into the `DISABLED` state, and the stream is automatically deleted after 24 hours.
    #
    # Use the `DescribeTable` action to check the status of the table.
    def delete_table(input : ADDB::DeleteTableInput) : Core::ParsedResponse(ADDB::DeleteTableOutput)
      Log.info { "performing 'DeleteTable' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteTable", "/", input.to_json)
      Core::ParsedResponse(ADDB::DeleteTableOutput).new(response)
    end
  end
end
