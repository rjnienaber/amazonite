private alias Core = Amazonite::Core

module Amazonite::EC2
  class CopyFpgaImageRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the source AFI.
    property source_fpga_image_id : String

    # The description for the new AFI.
    property description : String | Nil

    # The name for the new AFI. The default is the name of the source AFI.
    property name : String | Nil

    # The Region that contains the source AFI.
    property source_region : String

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    def initialize(
      @source_fpga_image_id : String,
      @source_region : String,
      @dry_run : Bool | Nil = nil,
      @description : String | Nil = nil,
      @name : String | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}SourceFpgaImageId", @source_fpga_image_id}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end

      params << {"#{prefix}SourceRegion", @source_region}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        source_fpga_image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceFpgaImageId']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
        source_region: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceRegion']")).not_nil!,
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @source_fpga_image_id, @description, @name, @source_region, @client_token)
  end
end
