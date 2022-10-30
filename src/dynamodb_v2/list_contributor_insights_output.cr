module Amazonite::DynamoDBV2
  class ListContributorInsightsOutput
    include JSON::Serializable

    @[JSON::Field(key: "ContributorInsightsSummaries")]
    property contributor_insights_summaries : Array(ContributorInsightsSummary) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @contributor_insights_summaries : Array(ContributorInsightsSummary) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
