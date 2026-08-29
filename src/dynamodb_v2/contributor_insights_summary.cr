private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class ContributorInsightsSummary
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "ContributorInsightsStatus", converter: ADDB::ContributorInsightsStatus)]
    property contributor_insights_status : ContributorInsightsStatus | Nil

    @[JSON::Field(key: "ContributorInsightsMode", converter: ADDB::ContributorInsightsMode)]
    property contributor_insights_mode : ContributorInsightsMode | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @index_name : String | Nil = nil,
      @contributor_insights_status : ContributorInsightsStatus | Nil = nil,
      @contributor_insights_mode : ContributorInsightsMode | Nil = nil,
    )
    end
  end
end
