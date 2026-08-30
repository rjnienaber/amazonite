private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class DescribeContributorInsightsOutput
    include JSON::Serializable

    # The name of the table being described.
    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    # The name of the global secondary index being described.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    # List of names of the associated contributor insights rules.
    @[JSON::Field(key: "ContributorInsightsRuleList")]
    property contributor_insights_rule_list : Array(String) | Nil

    # Current status of contributor insights.
    @[JSON::Field(key: "ContributorInsightsStatus", converter: ADDB::ContributorInsightsStatus)]
    property contributor_insights_status : ContributorInsightsStatus | Nil

    # Timestamp of the last time the status was changed.
    @[JSON::Field(key: "LastUpdateDateTime", converter: Core::AWSEpochConverter)]
    property last_update_date_time : Time | Nil

    # Returns information about the last failure that was encountered.
    #
    # The most common exceptions for a FAILED status are:
    #
    # - LimitExceededException - Per-account Amazon CloudWatch Contributor Insights rule limit
    # reached. Please disable Contributor Insights for other tables/indexes OR disable Contributor
    # Insights rules before retrying.
    #
    # - AccessDeniedException - Amazon CloudWatch Contributor Insights rules cannot be modified due to
    # insufficient permissions.
    #
    # - AccessDeniedException - Failed to create service-linked role for Contributor Insights due to
    # insufficient permissions.
    #
    # - InternalServerError - Failed to create Amazon CloudWatch Contributor Insights rules. Please
    # retry request.
    @[JSON::Field(key: "FailureException")]
    property failure_exception : FailureException | Nil

    # The mode of CloudWatch Contributor Insights for DynamoDB that determines which events are
    # emitted. Can be set to track all access and throttled events or throttled events only.
    @[JSON::Field(key: "ContributorInsightsMode", converter: ADDB::ContributorInsightsMode)]
    property contributor_insights_mode : ContributorInsightsMode | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @index_name : String | Nil = nil,
      @contributor_insights_rule_list : Array(String) | Nil = nil,
      @contributor_insights_status : ContributorInsightsStatus | Nil = nil,
      @last_update_date_time : Time | Nil = nil,
      @failure_exception : FailureException | Nil = nil,
      @contributor_insights_mode : ContributorInsightsMode | Nil = nil,
    )
    end
  end
end
