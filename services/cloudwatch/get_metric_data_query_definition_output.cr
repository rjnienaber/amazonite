private alias ACW = Amazonite::CloudWatch
private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class GetMetricDataQueryDefinitionOutput
    include JSON::Serializable

    # The ID of the metric data query definition.
    @[JSON::Field(key: "Id")]
    property id : String

    # The Amazon Resource Name (ARN) of the metric data query definition.
    @[JSON::Field(key: "Arn")]
    property arn : String

    # The path of the metric data query definition.
    @[JSON::Field(key: "Path")]
    property path : String

    # The query expression.
    @[JSON::Field(key: "Expression")]
    property expression : String

    # The language of the expression. Valid values are the following:
    #
    # - `PROMQL` – A PromQL query.
    #
    # - `SQL` – A CloudWatch Metrics Insights query.
    #
    # - `METRIC_MATH` – A metric math expression.
    @[JSON::Field(key: "Type", converter: ACW::QueryType)]
    property type : QueryType

    # The date and time when you created the metric data query definition.
    @[JSON::Field(key: "CreatedAt", converter: Core::AWSEpochConverter)]
    property created_at : Time

    # The date and time when you last updated the metric data query definition.
    @[JSON::Field(key: "UpdatedAt", converter: Core::AWSEpochConverter)]
    property updated_at : Time

    def initialize(
      @id : String,
      @arn : String,
      @path : String,
      @expression : String,
      @type : QueryType,
      @created_at : Time,
      @updated_at : Time,
    )
    end

    def validate! : Nil
      if value = @id
        raise Core::ValidationError.new("Id length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Id length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Id does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9-]{1,64}$"))
      end

      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Arn length must be <= 1024") if value.size > 1024
      end

      if value = @path
        raise Core::ValidationError.new("Path length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Path length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("Path does not match the required pattern") unless value.matches?(Regex.new("^[\\p{L}\\p{M}\\p{N}\\p{P}\\p{S}\\p{Zs}]+$"))
      end

      if value = @expression
        raise Core::ValidationError.new("Expression length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Expression length must be <= 65536") if value.size > 65536
      end
    end

    def_equals_and_hash(@id, @arn, @path, @expression, @type, @created_at, @updated_at)
  end
end
