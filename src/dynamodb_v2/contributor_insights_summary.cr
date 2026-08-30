private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents a Contributor Insights summary entry.
  class ContributorInsightsSummary
    include JSON::Serializable

    # Name of the table associated with the summary.
    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    # Name of the index associated with the summary, if any.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    # Describes the current status for contributor insights for the given table and index, if
    # applicable.
    @[JSON::Field(key: "ContributorInsightsStatus", converter: ADDB::ContributorInsightsStatus)]
    property contributor_insights_status : ContributorInsightsStatus | Nil

    # Indicates the current mode of CloudWatch Contributor Insights, specifying whether it tracks all
    # access and throttled events or throttled events only for the DynamoDB table or index.
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
