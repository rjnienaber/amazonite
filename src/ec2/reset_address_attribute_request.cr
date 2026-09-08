private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ResetAddressAttributeRequest
    # [EC2-VPC] The allocation ID.
    property allocation_id : String

    # The attribute of the IP address.
    property attribute : AddressAttributeName

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @allocation_id : String,
      @attribute : AddressAttributeName,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}AllocationId", @allocation_id}

      params << {"#{prefix}Attribute", @attribute.to_json_object_key}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AllocationId']")).not_nil!,
        attribute: ((n = node.xpath_node("*[local-name()='Attribute']")) ? AEC::AddressAttributeName.from_json_object_key?(n.content) : nil).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allocation_id, @attribute, @dry_run)
  end
end
