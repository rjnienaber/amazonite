module Amazonite::EventBridgeV1
  # These are custom parameters to be used when the target is a Amazon Redshift cluster to invoke
  # the Amazon Redshift Data API ExecuteStatement based on EventBridge events.
  class RedshiftDataParameters
    include JSON::Serializable

    # The name or ARN of the secret that enables access to the database. Required when authenticating
    # using Amazon Web Services Secrets Manager.
    @[JSON::Field(key: "SecretManagerArn")]
    property secret_manager_arn : String | Nil

    # The name of the database. Required when authenticating using temporary credentials.
    @[JSON::Field(key: "Database")]
    property database : String

    # The database user name. Required when authenticating using temporary credentials.
    @[JSON::Field(key: "DbUser")]
    property db_user : String | Nil

    # The SQL statement text to run.
    @[JSON::Field(key: "Sql")]
    property sql : String | Nil

    # The name of the SQL statement. You can name the SQL statement when you create it to identify the
    # query.
    @[JSON::Field(key: "StatementName")]
    property statement_name : String | Nil

    # Indicates whether to send an event back to EventBridge after the SQL statement runs.
    @[JSON::Field(key: "WithEvent")]
    property with_event : Bool | Nil

    # One or more SQL statements to run. The SQL statements are run as a single transaction. They run
    # serially in the order of the array. Subsequent SQL statements don't start until the previous
    # statement in the array completes. If any SQL statement fails, then because they are run as one
    # transaction, all work is rolled back.
    @[JSON::Field(key: "Sqls")]
    property sqls : Array(String) | Nil

    def initialize(
      @database : String,
      @secret_manager_arn : String | Nil = nil,
      @db_user : String | Nil = nil,
      @sql : String | Nil = nil,
      @statement_name : String | Nil = nil,
      @with_event : Bool | Nil = nil,
      @sqls : Array(String) | Nil = nil,
    )
    end
  end
end
