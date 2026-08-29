module Amazonite::LambdaV1
  class AccountUsage
    include JSON::Serializable

    @[JSON::Field(key: "TotalCodeSize")]
    property total_code_size : Int64 | Nil

    @[JSON::Field(key: "FunctionCount")]
    property function_count : Int64 | Nil

    def initialize(
      @total_code_size : Int64 | Nil = nil,
      @function_count : Int64 | Nil = nil,
    )
    end
  end
end
