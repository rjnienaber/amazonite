private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class PurchaseCapacityBlockRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The tags to apply to the Capacity Block during launch.
    property tag_specifications : Array(TagSpecification) | Nil

    # The ID of the Capacity Block offering.
    property capacity_block_offering_id : String

    # The type of operating system for which to reserve capacity.
    property instance_platform : CapacityReservationInstancePlatform

    def initialize(
      @capacity_block_offering_id : String,
      @instance_platform : CapacityReservationInstancePlatform,
      @dry_run : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
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

      params << {"#{prefix}CapacityBlockOfferingId", @capacity_block_offering_id}

      params << {"#{prefix}InstancePlatform", @instance_platform.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        capacity_block_offering_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CapacityBlockOfferingId']")).not_nil!,
        instance_platform: ((n = node.xpath_node("*[local-name()='InstancePlatform']")) ? AEC::CapacityReservationInstancePlatform.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @tag_specifications, @capacity_block_offering_id, @instance_platform)
  end
end
