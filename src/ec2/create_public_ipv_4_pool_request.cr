private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreatePublicIpv4PoolRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The key/value combination of a tag assigned to the resource. Use the tag key in the filter name
    # and the tag value as the filter value. For example, to find all resources that have a tag with
    # the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and `TeamA` for
    # the filter value.
    property tag_specifications : Array(TagSpecification) | Nil

    # The Availability Zone (AZ) or Local Zone (LZ) network border group that the resource that the IP
    # address is assigned to is in. Defaults to an AZ network border group. For more information on
    # available Local Zones, see [Local Zone
    # availability](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html#byoip-zone-avail)
    # in the *Amazon EC2 User Guide*.
    property network_border_group : String | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @network_border_group : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @network_border_group
        params << {"#{prefix}NetworkBorderGroup", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkBorderGroup']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @tag_specifications, @network_border_group)
  end
end
