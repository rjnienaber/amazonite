private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Specifies a destination streaming table on Apache Iceberg.
  class S3TablesConfiguration
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the Amazon S3 table bucket.
    @[JSON::Field(key: "TableBucketARN")]
    property table_bucket_arn : String

    # The namespace (database) of the destination table.
    @[JSON::Field(key: "Namespace")]
    property namespace : String

    # The name of the destination table. Amazon Kinesis Data Streams creates this table in the
    # specified table bucket.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # The compression applied to Parquet data files. Valid values:
    #
    # - `NONE` - No compression.
    #
    # - `ZSTD` - Zstandard compression.
    #
    # - `SNAPPY` - Snappy compression.
    @[JSON::Field(key: "CompressionType", converter: AK::S3TablesCompressionType)]
    property compression_type : S3TablesCompressionType

    # The partitioning specification for the destination table.
    @[JSON::Field(key: "PartitionSpec")]
    property partition_spec : PartitionSpec | Nil

    def initialize(
      @table_bucket_arn : String,
      @namespace : String,
      @table_name : String,
      @compression_type : S3TablesCompressionType,
      @partition_spec : PartitionSpec | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @table_bucket_arn
        raise Core::ValidationError.new("TableBucketARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableBucketARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("TableBucketARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[-a-z0-9]*:s3tables:[-a-z0-9]+:\\d{12}:bucket/[a-z0-9_-]{3,63}$"))
      end

      if value = @namespace
        raise Core::ValidationError.new("Namespace length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Namespace length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("Namespace does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-z_]+$"))
      end

      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("TableName does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-z_]+$"))
      end

      if value = @partition_spec
        value.validate!
      end
    end

    def_equals_and_hash(@table_bucket_arn, @namespace, @table_name, @compression_type, @partition_spec)
  end
end
