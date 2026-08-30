private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @secret_manager_arn
        raise Core::ValidationError.new("SecretManagerArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretManagerArn length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("SecretManagerArn does not match the required pattern") unless value.matches?(Regex.new("^(^arn:aws([a-z]|\\-)*:secretsmanager:[a-z0-9-.]+:.*)|(\\$(\\.[\\w_-]+(\\[(\\d+|\\*)\\])*)*)$"))
      end

      if value = @database
        raise Core::ValidationError.new("Database length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Database length must be <= 64") if value.size > 64
      end

      if value = @db_user
        raise Core::ValidationError.new("DbUser length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DbUser length must be <= 128") if value.size > 128
      end

      if value = @sql
        raise Core::ValidationError.new("Sql length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Sql length must be <= 100000") if value.size > 100000
      end

      if value = @statement_name
        raise Core::ValidationError.new("StatementName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StatementName length must be <= 500") if value.size > 500
      end

      if value = @sqls
        raise Core::ValidationError.new("Sqls must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Sqls must have at most 40 item(s)") if value.size > 40
      end
    end

    def_equals_and_hash(@secret_manager_arn, @database, @db_user, @sql, @statement_name, @with_event, @sqls)
  end
end
