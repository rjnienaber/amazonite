private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class ListBulkOperationsOutput
    include JSON::Serializable

    # A list of bulk operation summaries for the current Amazon Web Services account and Amazon Web
    # Services Region.
    @[JSON::Field(key: "BulkOperationsSummaryList")]
    property bulk_operations_summary_list : Array(BulkOperationSummary) | Nil

    # If this value is returned, there are additional results to be displayed. To retrieve them, call
    # `ListBulkOperations` again, with `NextToken` set to this value.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @bulk_operations_summary_list : Array(BulkOperationSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @bulk_operations_summary_list
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("NextToken does not match the required pattern") unless value.matches?(Regex.new("^([0-9a-f]{16})+$"))
      end
    end

    def_equals_and_hash(@bulk_operations_summary_list, @next_token)
  end
end
