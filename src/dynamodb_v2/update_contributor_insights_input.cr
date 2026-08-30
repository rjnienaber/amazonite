private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class UpdateContributorInsightsInput
    include JSON::Serializable

    # The name of the table. You can also provide the Amazon Resource Name (ARN) of the table in this
    # parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # The global secondary index name, if applicable.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    # Represents the contributor insights action.
    @[JSON::Field(key: "ContributorInsightsAction", converter: ADDB::ContributorInsightsAction)]
    property contributor_insights_action : ContributorInsightsAction

    # Specifies whether to track all access and throttled events or throttled events only for the
    # DynamoDB table or index.
    @[JSON::Field(key: "ContributorInsightsMode", converter: ADDB::ContributorInsightsMode)]
    property contributor_insights_mode : ContributorInsightsMode | Nil

    def initialize(
      @table_name : String,
      @contributor_insights_action : ContributorInsightsAction,
      @index_name : String | Nil = nil,
      @contributor_insights_mode : ContributorInsightsMode | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end

      if value = @index_name
        raise Core::ValidationError.new("IndexName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("IndexName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("IndexName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end
    end

    def_equals_and_hash(@table_name, @index_name, @contributor_insights_action, @contributor_insights_mode)
  end
end
