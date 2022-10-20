private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class UpdateContributorInsightsInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "ContributorInsightsAction", converter: ADDB::ContributorInsightsAction)]
    property contributor_insights_action : ContributorInsightsAction

    def initialize(
      @table_name : String,
      @contributor_insights_action : ContributorInsightsAction,
      @index_name : String | Nil = nil
    )
    end
  end
end