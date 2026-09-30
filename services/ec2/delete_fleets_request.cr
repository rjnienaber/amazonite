private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteFleetsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the EC2 Fleets.
    #
    # Constraints: In a single request, you can specify up to 25 `instant` fleet IDs and up to 100
    # `maintain` or `request` fleet IDs.
    property fleet_ids : Array(String) = [] of String

    # Indicates whether to terminate the associated instances when the EC2 Fleet is deleted. The
    # default is to terminate the instances.
    #
    # To let the instances continue to run after the EC2 Fleet is deleted, specify
    # `no-terminate-instances`. Supported only for fleets of type `maintain` and `request`.
    #
    # For `instant` fleets, you cannot specify `NoTerminateInstances`. A deleted `instant` fleet with
    # running instances is not supported.
    property terminate_instances : Bool

    def initialize(
      @fleet_ids : Array(String),
      @terminate_instances : Bool,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      @fleet_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}FleetId.#{i}", item}
      end

      params << {"#{prefix}TerminateInstances", Core::QueryValue.bool(@terminate_instances)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        fleet_ids: node.xpath_nodes("*[local-name()='FleetId']/*[local-name()='item']").map { |n| n.content },
        terminate_instances: Core::XMLValue.bool(node.xpath_node("*[local-name()='TerminateInstances']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @fleet_ids, @terminate_instances)
  end
end
