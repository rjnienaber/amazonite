private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeImageAttribute.
  class DescribeImageAttributeRequest
    # The AMI attribute.
    #
    # **Note**: The `blockDeviceMapping` attribute is deprecated. Using this attribute returns the
    # `Client.AuthFailure` error. To get information about the block device mappings for an AMI,
    # describe the image instead.
    property attribute : ImageAttributeName

    # The ID of the AMI.
    property image_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @attribute : ImageAttributeName,
      @image_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Attribute", @attribute.to_json_object_key}

      params << {"#{prefix}ImageId", @image_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attribute: ((n = node.xpath_node("*[local-name()='Attribute']")) ? AEC::ImageAttributeName.from_json_object_key?(n.content) : nil).not_nil!,
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@attribute, @image_id, @dry_run)
  end
end
