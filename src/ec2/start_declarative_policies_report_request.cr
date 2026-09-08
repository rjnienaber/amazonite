private alias Core = Amazonite::Core

module Amazonite::EC2
  class StartDeclarativePoliciesReportRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The name of the S3 bucket where the report will be saved. The bucket must be in the same Region
    # where the report generation request is made.
    property s3_bucket : String

    # The prefix for your S3 object.
    property s3_prefix : String | Nil

    # The root ID, organizational unit ID, or account ID.
    #
    # Format:
    #
    # - For root: `r-ab12`
    #
    # - For OU: `ou-ab12-cdef1234`
    #
    # - For account: `123456789012`
    property target_id : String

    # The tags to apply.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @s3_bucket : String,
      @target_id : String,
      @dry_run : Bool | Nil = nil,
      @s3_prefix : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}S3Bucket", @s3_bucket}

      if value = @s3_prefix
        params << {"#{prefix}S3Prefix", value}
      end

      params << {"#{prefix}TargetId", @target_id}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        s3_bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='S3Bucket']")).not_nil!,
        s3_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='S3Prefix']")),
        target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetId']")).not_nil!,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @s3_bucket, @s3_prefix, @target_id, @tag_specifications)
  end
end
