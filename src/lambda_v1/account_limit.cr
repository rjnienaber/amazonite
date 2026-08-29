module Amazonite::LambdaV1
  class AccountLimit
    include JSON::Serializable

    @[JSON::Field(key: "TotalCodeSize")]
    property total_code_size : Int64 | Nil

    @[JSON::Field(key: "CodeSizeUnzipped")]
    property code_size_unzipped : Int64 | Nil

    @[JSON::Field(key: "CodeSizeZipped")]
    property code_size_zipped : Int64 | Nil

    @[JSON::Field(key: "ConcurrentExecutions")]
    property concurrent_executions : Int32 | Nil

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
  end
end
