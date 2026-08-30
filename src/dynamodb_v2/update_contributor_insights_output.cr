private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class UpdateContributorInsightsOutput
    include JSON::Serializable

    # The name of the table.
    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    # The name of the global secondary index, if applicable.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    # The status of contributor insights
    @[JSON::Field(key: "ContributorInsightsStatus", converter: ADDB::ContributorInsightsStatus)]
    property contributor_insights_status : ContributorInsightsStatus | Nil

    # The updated mode of CloudWatch Contributor Insights that determines whether to monitor all
    # access and throttled events or to track throttled events exclusively.
    @[JSON::Field(key: "ContributorInsightsMode", converter: ADDB::ContributorInsightsMode)]
    property contributor_insights_mode : ContributorInsightsMode | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @index_name : String | Nil = nil,
      @contributor_insights_status : ContributorInsightsStatus | Nil = nil,
      @contributor_insights_mode : ContributorInsightsMode | Nil = nil,
    )
    end

    def_equals_and_hash(@table_name, @index_name, @contributor_insights_status, @contributor_insights_mode)
  end
end
