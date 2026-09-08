private alias Core = Amazonite::Core

module Amazonite::EC2
  class DetachImageWatermarkRequest
    # The ID of the AMI.
    property image_id : String

    # The watermark key to remove, in `accountId:watermarkName` format (for example,
    # `123456789012:approvedAmi`).
    property watermark_key : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @image_id : String,
      @watermark_key : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ImageId", @image_id}

      params << {"#{prefix}WatermarkKey", @watermark_key}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")).not_nil!,
        watermark_key: Core::XMLValue.string(node.xpath_node("*[local-name()='WatermarkKey']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@image_id, @watermark_key, @dry_run)
  end
end
