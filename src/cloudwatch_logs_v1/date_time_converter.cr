module Amazonite::CloudWatchLogsV1
  # This processor converts a datetime string into a format that you specify.
  #
  # For more information about this processor including examples, see [
  # datetimeConverter](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-datetimeConverter)
  # in the *CloudWatch Logs User Guide*.
  class DateTimeConverter
    include JSON::Serializable

    # The key to apply the date conversion to.
    @[JSON::Field(key: "source")]
    property source : String

    # The JSON field to store the result in.
    @[JSON::Field(key: "target")]
    property target : String

    # The datetime format to use for the converted data in the target field.
    #
    # If you omit this, the default of ` yyyy-MM-dd'T'HH:mm:ss.SSS'Z` is used.
    @[JSON::Field(key: "targetFormat")]
    property target_format : String | Nil

    # A list of patterns to match against the `source` field.
    @[JSON::Field(key: "matchPatterns")]
    property match_patterns : Array(String) = [] of String

    # The time zone of the source field. If you omit this, the default used is the UTC zone.
    @[JSON::Field(key: "sourceTimezone")]
    property source_timezone : String | Nil

    # The time zone of the target field. If you omit this, the default used is the UTC zone.
    @[JSON::Field(key: "targetTimezone")]
    property target_timezone : String | Nil

    # The locale of the source field. If you omit this, the default of `locale.ROOT` is used.
    @[JSON::Field(key: "locale")]
    property locale : String | Nil

    def initialize(
      @source : String,
      @target : String,
      @match_patterns : Array(String),
      @target_format : String | Nil = nil,
      @source_timezone : String | Nil = nil,
      @target_timezone : String | Nil = nil,
      @locale : String | Nil = nil,
    )
    end

    def_equals_and_hash(@source, @target, @target_format, @match_patterns, @source_timezone, @target_timezone, @locale)
  end
end
