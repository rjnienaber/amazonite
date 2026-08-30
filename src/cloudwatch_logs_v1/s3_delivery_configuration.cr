private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # This structure contains delivery configurations that apply only when the delivery destination
  # resource is an S3 bucket.
  class S3DeliveryConfiguration
    include JSON::Serializable

    # This string allows re-configuring the S3 object prefix to contain either static or variable
    # sections. The valid variables to use in the suffix path will vary by each log source. To find
    # the values supported for the suffix path for each log source, use the
    # [DescribeConfigurationTemplates](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeConfigurationTemplates.html)
    # operation and check the `allowedSuffixPathFields` field in the response.
    @[JSON::Field(key: "suffixPath")]
    property suffix_path : String | Nil

    # This parameter causes the S3 objects that contain delivered logs to use a prefix structure that
    # allows for integration with Apache Hive.
    @[JSON::Field(key: "enableHiveCompatiblePath")]
    property enable_hive_compatible_path : Bool | Nil

    def initialize(
      @suffix_path : String | Nil = nil,
      @enable_hive_compatible_path : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @suffix_path
        raise Core::ValidationError.new("suffixPath length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("suffixPath length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@suffix_path, @enable_hive_compatible_path)
  end
end
