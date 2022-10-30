module Amazonite::DynamoDBV2
  class ListImportsOutput
    include JSON::Serializable

    @[JSON::Field(key: "ImportSummaryList")]
    property import_summary_list : Array(ImportSummary) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @import_summary_list : Array(ImportSummary) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
