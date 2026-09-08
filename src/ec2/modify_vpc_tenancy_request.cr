private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpcTenancyRequest
    # The ID of the VPC.
    property vpc_id : String

    # The instance tenancy attribute for the VPC.
    property instance_tenancy : VpcTenancy

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @vpc_id : String,
      @instance_tenancy : VpcTenancy,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VpcId", @vpc_id}

      params << {"#{prefix}InstanceTenancy", @instance_tenancy.to_json_object_key}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcId']")).not_nil!,
        instance_tenancy: ((n = node.xpath_node("*[local-name()='InstanceTenancy']")) ? AEC::VpcTenancy.from_json_object_key?(n.content) : nil).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@vpc_id, @instance_tenancy, @dry_run)
  end
end
