module Amazonite::DynamoDBV2
  class ListExportsOutput
    include JSON::Serializable

    # A list of `ExportSummary` objects.
    @[JSON::Field(key: "ExportSummaries")]
    property export_summaries : Array(ExportSummary) | Nil

    # If this value is returned, there are additional results to be displayed. To retrieve them, call
    # `ListExports` again, with `NextToken` set to this value.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @export_summaries : Array(ExportSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@export_summaries, @next_token)
  end
end
