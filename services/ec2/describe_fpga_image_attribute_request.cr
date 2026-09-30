private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeFpgaImageAttributeRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the AFI.
    property fpga_image_id : String

    # The AFI attribute.
    property attribute : FpgaImageAttributeName

    def initialize(
      @fpga_image_id : String,
      @attribute : FpgaImageAttributeName,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}FpgaImageId", @fpga_image_id}

      params << {"#{prefix}Attribute", @attribute.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        fpga_image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='FpgaImageId']")).not_nil!,
        attribute: ((n = node.xpath_node("*[local-name()='Attribute']")) ? AEC::FpgaImageAttributeName.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @fpga_image_id, @attribute)
  end
end
