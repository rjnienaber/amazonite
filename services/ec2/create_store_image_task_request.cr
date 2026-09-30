private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateStoreImageTaskRequest
    # The ID of the AMI.
    property image_id : String

    # The name of the Amazon S3 bucket in which the AMI object will be stored. The bucket must be in
    # the Region in which the request is being made. The AMI object appears in the bucket only after
    # the upload task has completed.
    property bucket : String

    # The tags to apply to the AMI object that will be stored in the Amazon S3 bucket.
    property s3_object_tags : Array(S3ObjectTag) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @image_id : String,
      @bucket : String,
      @s3_object_tags : Array(S3ObjectTag) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ImageId", @image_id}

      params << {"#{prefix}Bucket", @bucket}

      (@s3_object_tags || [] of S3ObjectTag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}S3ObjectTag.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")).not_nil!,
        bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='Bucket']")).not_nil!,
        s3_object_tags: node.xpath_nodes("*[local-name()='S3ObjectTag']/*[local-name()='item']").map { |n| S3ObjectTag.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @s3_object_tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@image_id, @bucket, @s3_object_tags, @dry_run)
  end
end
