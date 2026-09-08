private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateCapacityManagerDataExportRequest
    # The name of the S3 bucket where the capacity data export files will be delivered. The bucket
    # must exist and you must have write permissions to it.
    property s3_bucket_name : String

    # The S3 key prefix for the exported data files. This allows you to organize exports in a specific
    # folder structure within your bucket. If not specified, files are placed at the bucket root.
    property s3_bucket_prefix : String | Nil

    # The frequency at which data exports are generated.
    property schedule : Schedule

    # The file format for the exported data. Parquet format is recommended for large datasets and
    # better compression.
    property output_format : OutputFormat

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see Ensure Idempotency.
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The tags to apply to the data export configuration. You can tag the export for organization and
    # cost tracking purposes.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @s3_bucket_name : String,
      @schedule : Schedule,
      @output_format : OutputFormat,
      @s3_bucket_prefix : String | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}S3BucketName", @s3_bucket_name}

      if value = @s3_bucket_prefix
        params << {"#{prefix}S3BucketPrefix", value}
      end

      params << {"#{prefix}Schedule", @schedule.to_json_object_key}

      params << {"#{prefix}OutputFormat", @output_format.to_json_object_key}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        s3_bucket_name: Core::XMLValue.string(node.xpath_node("*[local-name()='S3BucketName']")).not_nil!,
        s3_bucket_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='S3BucketPrefix']")),
        schedule: ((n = node.xpath_node("*[local-name()='Schedule']")) ? AEC::Schedule.from_json_object_key?(n.content) : nil).not_nil!,
        output_format: ((n = node.xpath_node("*[local-name()='OutputFormat']")) ? AEC::OutputFormat.from_json_object_key?(n.content) : nil).not_nil!,
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@s3_bucket_name, @s3_bucket_prefix, @schedule, @output_format, @client_token, @dry_run, @tag_specifications)
  end
end
