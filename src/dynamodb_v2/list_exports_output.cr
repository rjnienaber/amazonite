module Amazonite::DynamoDBV2
  class ListExportsOutput
    include JSON::Serializable

    @[JSON::Field(key: "ExportSummaries")]
    property export_summaries : Array(ExportSummary) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @export_summaries : Array(ExportSummary) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
