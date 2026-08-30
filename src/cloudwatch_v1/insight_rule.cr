module Amazonite::CloudWatchV1
  # This structure contains the definition for a Contributor Insights rule. For more information
  # about this rule, see[ Using Constributor Insights to analyze high-cardinality
  # data](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights.html)
  # in the *Amazon CloudWatch User Guide*.
  class InsightRule
    include JSON::Serializable

    # The name of the rule.
    @[JSON::Field(key: "Name")]
    property name : String

    # Indicates whether the rule is enabled or disabled.
    @[JSON::Field(key: "State")]
    property state : String

    # For rules that you create, this is always `{"Name": "CloudWatchLogRule", "Version": 1}`. For
    # managed rules, this is `{"Name": "ServiceLogRule", "Version": 1}`
    @[JSON::Field(key: "Schema")]
    property schema : String

    # The definition of the rule, as a JSON object. The definition contains the keywords used to
    # define contributors, the value to aggregate on if this rule returns a sum instead of a count,
    # and the filters. For details on the valid syntax, see [Contributor Insights Rule
    # Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights-RuleSyntax.html).
    @[JSON::Field(key: "Definition")]
    property definition : String

    # An optional built-in rule that Amazon Web Services manages.
    @[JSON::Field(key: "ManagedRule")]
    property managed_rule : Bool | Nil

    # Displays whether the rule is evaluated on the transformed versions of logs, for log groups that
    # have [Log
    # transformation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html)
    # enabled. If this is `false`, log events are evaluated before they are transformed.
    @[JSON::Field(key: "ApplyOnTransformedLogs")]
    property apply_on_transformed_logs : Bool | Nil

    def initialize(
      @name : String,
      @state : String,
      @schema : String,
      @definition : String,
      @managed_rule : Bool | Nil = nil,
      @apply_on_transformed_logs : Bool | Nil = nil,
    )
    end
  end
end
