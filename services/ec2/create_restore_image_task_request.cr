private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateRestoreImageTaskRequest
    # The name of the Amazon S3 bucket that contains the stored AMI object.
    property bucket : String

    # The name of the stored AMI object in the bucket.
    property object_key : String

    # The name for the restored AMI. The name must be unique for AMIs in the Region for this account.
    # If you do not provide a name, the new AMI gets the same name as the original AMI.
    property name : String | Nil

    # The tags to apply to the AMI and snapshots on restoration. You can tag the AMI, the snapshots,
    # or both.
    #
    # - To tag the AMI, the value for `ResourceType` must be `image`.
    #
    # - To tag the snapshots, the value for `ResourceType` must be `snapshot`. The same tag is applied
    # to all of the snapshots that are created.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @bucket : String,
      @object_key : String,
      @name : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Bucket", @bucket}

      params << {"#{prefix}ObjectKey", @object_key}

      if value = @name
        params << {"#{prefix}Name", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='Bucket']")).not_nil!,
        object_key: Core::XMLValue.string(node.xpath_node("*[local-name()='ObjectKey']")).not_nil!,
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("Name length must be <= 128") if value.size > 128
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@bucket, @object_key, @name, @tag_specifications, @dry_run)
  end
end
