private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class ContributorInsightsSummary
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "ContributorInsightsStatus", converter: ADDB::ContributorInsightsStatus)]
    property contributor_insights_status : ContributorInsightsStatus | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @index_name : String | Nil = nil,
      @contributor_insights_status : ContributorInsightsStatus | Nil = nil
    )
    end
  end
end
