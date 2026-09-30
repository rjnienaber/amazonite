private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Limits that are related to concurrency and storage. All file and storage sizes are in bytes.
  class AccountLimit
    include JSON::Serializable

    # The amount of storage space that you can use for all deployment packages and layer archives.
    @[JSON::Field(key: "TotalCodeSize")]
    property total_code_size : Int64 | Nil

    # The maximum size of a function's deployment package and layers when they're extracted.
    @[JSON::Field(key: "CodeSizeUnzipped")]
    property code_size_unzipped : Int64 | Nil

    # The maximum size of a deployment package when it's uploaded directly to Lambda. Use Amazon S3
    # for larger files.
    @[JSON::Field(key: "CodeSizeZipped")]
    property code_size_zipped : Int64 | Nil

    # The maximum number of simultaneous function executions.
    @[JSON::Field(key: "ConcurrentExecutions")]
    property concurrent_executions : Int32 | Nil

    # The maximum number of simultaneous function executions, minus the capacity that's reserved for
    # individual functions with PutFunctionConcurrency.
    @[JSON::Field(key: "UnreservedConcurrentExecutions")]
    property unreserved_concurrent_executions : Int32 | Nil

    def initialize(
      @total_code_size : Int64 | Nil = nil,
      @code_size_unzipped : Int64 | Nil = nil,
      @code_size_zipped : Int64 | Nil = nil,
      @concurrent_executions : Int32 | Nil = nil,
      @unreserved_concurrent_executions : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @unreserved_concurrent_executions
        raise Core::ValidationError.new("UnreservedConcurrentExecutions value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@total_code_size, @code_size_unzipped, @code_size_zipped, @concurrent_executions, @unreserved_concurrent_executions)
  end
end
