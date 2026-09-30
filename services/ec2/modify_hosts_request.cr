private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyHostsRequest
    # Indicates whether to enable or disable host recovery for the Dedicated Host. For more
    # information, see [Host
    # recovery](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-recovery.html) in
    # the *Amazon EC2 User Guide*.
    property host_recovery : HostRecovery | Nil

    # Specifies the instance type to be supported by the Dedicated Host. Specify this parameter to
    # modify a Dedicated Host to support only a specific instance type.
    #
    # If you want to modify a Dedicated Host to support multiple instance types in its current
    # instance family, omit this parameter and specify **InstanceFamily** instead. You cannot specify
    # **InstanceType** and **InstanceFamily** in the same request.
    property instance_type : String | Nil

    # Specifies the instance family to be supported by the Dedicated Host. Specify this parameter to
    # modify a Dedicated Host to support multiple instance types within its current instance family.
    #
    # If you want to modify a Dedicated Host to support a specific instance type only, omit this
    # parameter and specify **InstanceType** instead. You cannot specify **InstanceFamily** and
    # **InstanceType** in the same request.
    property instance_family : String | Nil

    # Indicates whether to enable or disable host maintenance for the Dedicated Host. For more
    # information, see [Host
    # maintenance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-maintenance.html)
    # in the *Amazon EC2 User Guide*.
    property host_maintenance : HostMaintenance | Nil

    # The IDs of the Dedicated Hosts to modify.
    property host_ids : Array(String) = [] of String

    # Specify whether to enable or disable auto-placement.
    property auto_placement : AutoPlacement | Nil

    def initialize(
      @host_ids : Array(String),
      @host_recovery : HostRecovery | Nil = nil,
      @instance_type : String | Nil = nil,
      @instance_family : String | Nil = nil,
      @host_maintenance : HostMaintenance | Nil = nil,
      @auto_placement : AutoPlacement | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @host_recovery
        params << {"#{prefix}HostRecovery", value.to_json_object_key}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @instance_family
        params << {"#{prefix}InstanceFamily", value}
      end

      if value = @host_maintenance
        params << {"#{prefix}HostMaintenance", value.to_json_object_key}
      end

      @host_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}HostId.#{i}", item}
      end

      if value = @auto_placement
        params << {"#{prefix}AutoPlacement", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        host_recovery: (n = node.xpath_node("*[local-name()='HostRecovery']")) ? AEC::HostRecovery.from_json_object_key?(n.content) : nil,
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceType']")),
        instance_family: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceFamily']")),
        host_maintenance: (n = node.xpath_node("*[local-name()='HostMaintenance']")) ? AEC::HostMaintenance.from_json_object_key?(n.content) : nil,
        host_ids: node.xpath_nodes("*[local-name()='hostId']/*[local-name()='item']").map { |n| n.content },
        auto_placement: (n = node.xpath_node("*[local-name()='autoPlacement']")) ? AEC::AutoPlacement.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@host_recovery, @instance_type, @instance_family, @host_maintenance, @host_ids, @auto_placement)
  end
end
