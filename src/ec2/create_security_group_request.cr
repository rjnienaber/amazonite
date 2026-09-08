private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateSecurityGroupRequest
    # A description for the security group.
    #
    # Constraints: Up to 255 characters in length
    #
    # Valid characters: a-z, A-Z, 0-9, spaces, and ._-:/()#,@[]+=&;{}!$*
    property description : String

    # The name of the security group. Names are case-insensitive and must be unique within the VPC.
    #
    # Constraints: Up to 255 characters in length. Can't start with `sg-`.
    #
    # Valid characters: a-z, A-Z, 0-9, spaces, and ._-:/()#,@[]+=&;{}!$*
    property group_name : String

    # The ID of the VPC. Required for a nondefault VPC.
    property vpc_id : String | Nil

    # The tags to assign to the security group.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @description : String,
      @group_name : String,
      @vpc_id : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}GroupDescription", @description}

      params << {"#{prefix}GroupName", @group_name}

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
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
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupDescription']")).not_nil!,
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")).not_nil!,
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcId']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@description, @group_name, @vpc_id, @tag_specifications, @dry_run)
  end
end
