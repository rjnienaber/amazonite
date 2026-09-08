private alias Core = Amazonite::Core

module Amazonite::EC2
  class AttachImageWatermarkRequest
    # The ID of the AMI.
    property image_id : String

    # The name for the watermark. Combined with the caller's account ID to form the `WatermarkKey`
    # (`accountId:watermarkName`).
    #
    # Constraints: 3-128 alphanumeric characters, parentheses (()), square brackets ([]), spaces ( ),
    # periods (.), slashes (/), dashes (-), single quotes ('), at-signs (@), or underscores(_)
    property watermark_name : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @image_id : String,
      @watermark_name : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ImageId", @image_id}

      params << {"#{prefix}WatermarkName", @watermark_name}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")).not_nil!,
        watermark_name: Core::XMLValue.string(node.xpath_node("*[local-name()='WatermarkName']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @watermark_name
        raise Core::ValidationError.new("WatermarkName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("WatermarkName length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@image_id, @watermark_name, @dry_run)
  end
end
