module Amazonite::DynamoDBV2
  class ListImportsOutput
    include JSON::Serializable

    # A list of `ImportSummary` objects.
    @[JSON::Field(key: "ImportSummaryList")]
    property import_summary_list : Array(ImportSummary) | Nil

    # If this value is returned, there are additional results to be displayed. To retrieve them, call
    # `ListImports` again, with `NextToken` set to this value.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @import_summary_list : Array(ImportSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
