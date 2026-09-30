private alias Core = Amazonite::Core

module Amazonite::EC2
  class AttachClassicLinkVpcRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the EC2-Classic instance.
    property instance_id : String

    # The ID of the ClassicLink-enabled VPC.
    property vpc_id : String

    # The IDs of the security groups. You cannot specify security groups from a different VPC.
    property groups : Array(String) = [] of String

    def initialize(
      @instance_id : String,
      @vpc_id : String,
      @groups : Array(String),
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}InstanceId", @instance_id}

      params << {"#{prefix}VpcId", @vpc_id}

      @groups.each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")).not_nil!,
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")).not_nil!,
        groups: node.xpath_nodes("*[local-name()='SecurityGroupId']/*[local-name()='groupId']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @instance_id, @vpc_id, @groups)
  end
end
