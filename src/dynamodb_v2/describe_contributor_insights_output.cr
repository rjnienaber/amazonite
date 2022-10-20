private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class DescribeContributorInsightsOutput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "ContributorInsightsRuleList")]
    property contributor_insights_rule_list : Array(String) | Nil

    @[JSON::Field(key: "ContributorInsightsStatus", converter: ADDB::ContributorInsightsStatus)]
    property contributor_insights_status : ContributorInsightsStatus | Nil

    @[JSON::Field(key: "LastUpdateDateTime", converter: AC::AWSEpochConverter)]
    property last_update_date_time : Time | Nil

    @[JSON::Field(key: "FailureException")]
    property failure_exception : FailureException | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @index_name : String | Nil = nil,
      @contributor_insights_rule_list : Array(String) | Nil = nil,
      @contributor_insights_status : ContributorInsightsStatus | Nil = nil,
      @last_update_date_time : Time | Nil = nil,
      @failure_exception : FailureException | Nil = nil
    )
    end
  end
end