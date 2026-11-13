private alias ACW = Amazonite::CloudWatch
private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class PutMetricDataQueryDefinitionInput
    include JSON::Serializable

    # The ID of the metric data query definition to update. Omit this parameter to create a
    # definition. CloudWatch then generates the ID and returns it in the response.
    @[JSON::Field(key: "Id")]
    property id : String | Nil

    # The name of the metric data query definition. Use slashes (`/`) to organize definitions into
    # folders, for example `team/web/latency`. The path must meet the following requirements:
    #
    # - It must be unique in your account and Region.
    #
    # - It can't start or end with a slash.
    #
    # - It can't contain an empty folder name (`//`).
    #
    # - It can be at most 1,015 bytes when encoded as UTF-8.
    @[JSON::Field(key: "Path")]
    property path : String

    # The query expression, in the language that `Type` specifies. CloudWatch doesn't validate or run
    # the expression when you save it.
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

    # A list of key-value pairs to associate with the metric data query definition. You can use tags
    # to categorize definitions and to control access to them. Tags are applied only when the request
    # creates a definition, that is, when you omit `Id`. To change the tags of an existing definition,
    # use `TagResource` and `UntagResource`.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @path : String,
      @expression : String,
      @type : QueryType,
      @id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @id
        raise Core::ValidationError.new("Id length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Id length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Id does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9-]{1,64}$"))
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

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@id, @path, @expression, @type, @tags)
  end
end
