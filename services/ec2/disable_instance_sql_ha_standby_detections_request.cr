private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisableInstanceSqlHaStandbyDetectionsRequest
    # The IDs of the instances to disable from SQL Server High Availability standby detection
    # monitoring.
    property instance_ids : Array(String) = [] of String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @instance_ids : Array(String),
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @instance_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_ids: node.xpath_nodes("*[local-name()='InstanceId']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @instance_ids
        raise Core::ValidationError.new("InstanceIds must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("InstanceIds must have at most 30 item(s)") if value.size > 30
      end
    end

    def_equals_and_hash(@instance_ids, @dry_run)
  end
end
