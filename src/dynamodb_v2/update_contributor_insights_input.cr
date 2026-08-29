private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class UpdateContributorInsightsInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "ContributorInsightsAction", converter: ADDB::ContributorInsightsAction)]
    property contributor_insights_action : ContributorInsightsAction

    @[JSON::Field(key: "ContributorInsightsMode", converter: ADDB::ContributorInsightsMode)]
    property contributor_insights_mode : ContributorInsightsMode | Nil

    def initialize(
      @table_name : String,
      @contributor_insights_action : ContributorInsightsAction,
      @index_name : String | Nil = nil,
      @contributor_insights_mode : ContributorInsightsMode | Nil = nil,
    )
    end
  end
end
