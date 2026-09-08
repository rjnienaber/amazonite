private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyAddressAttributeRequest
    # [EC2-VPC] The allocation ID.
    property allocation_id : String

    # The domain name to modify for the IP address.
    property domain_name : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @allocation_id : String,
      @domain_name : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}AllocationId", @allocation_id}

      if value = @domain_name
        params << {"#{prefix}DomainName", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AllocationId']")).not_nil!,
        domain_name: Core::XMLValue.string(node.xpath_node("*[local-name()='DomainName']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allocation_id, @domain_name, @dry_run)
  end
end
