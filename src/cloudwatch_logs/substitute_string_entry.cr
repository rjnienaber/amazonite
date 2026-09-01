private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # This object defines one log field key that will be replaced using the [
  # substituteString](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-substituteString)
  # processor.
  class SubstituteStringEntry
    include JSON::Serializable

    # The key to modify
    @[JSON::Field(key: "source")]
    property source : String

    # The regular expression string to be replaced. Special regex characters such as [ and ] must be
    # escaped using \\ when using double quotes and with \ when using single quotes. For more
    # information, see [ Class
    # Pattern](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/regex/Pattern.html)
    # on the Oracle web site.
    @[JSON::Field(key: "from")]
    property from : String

    # The string to be substituted for each match of `from`
    @[JSON::Field(key: "to")]
    property to : String

    def initialize(
      @source : String,
      @from : String,
      @to : String,
    )
    end

    def validate! : Nil
      if value = @source
        raise Core::ValidationError.new("source length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("source length must be <= 128") if value.size > 128
      end

      if value = @from
        raise Core::ValidationError.new("from length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("from length must be <= 128") if value.size > 128
      end

      if value = @to
        raise Core::ValidationError.new("to length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("to length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@source, @from, @to)
  end
end
