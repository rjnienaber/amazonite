private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class ListContributorInsightsOutput
    include JSON::Serializable

    # A list of ContributorInsightsSummary.
    @[JSON::Field(key: "ContributorInsightsSummaries")]
    property contributor_insights_summaries : Array(ContributorInsightsSummary) | Nil

    # A token to go to the next page if there is one.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @contributor_insights_summaries : Array(ContributorInsightsSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @contributor_insights_summaries
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@contributor_insights_summaries, @next_token)
  end
end
