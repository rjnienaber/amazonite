module Amazonite::Lambda
  # The number of functions and amount of storage in use.
  class AccountUsage
    include JSON::Serializable

    # The amount of storage space, in bytes, that's being used by deployment packages and layer
    # archives.
    @[JSON::Field(key: "TotalCodeSize")]
    property total_code_size : Int64 | Nil

    # The number of Lambda functions.
    @[JSON::Field(key: "FunctionCount")]
    property function_count : Int64 | Nil

    def initialize(
      @total_code_size : Int64 | Nil = nil,
      @function_count : Int64 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@total_code_size, @function_count)
  end
end
