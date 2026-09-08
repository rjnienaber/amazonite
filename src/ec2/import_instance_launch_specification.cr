private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the launch specification for VM import.
  class ImportInstanceLaunchSpecification
    # The architecture of the instance.
    property architecture : ArchitectureValues | Nil

    # The security group names.
    property group_names : Array(String) | Nil

    # The security group IDs.
    property group_ids : Array(String) | Nil

    # Reserved.
    property additional_info : String | Nil

    # The Base64-encoded user data to make available to the instance.
    property user_data : UserData | Nil

    # The instance type. For more information about the instance types that you can import, see
    # [Instance
    # Types](https://docs.aws.amazon.com/vm-import/latest/userguide/vmie_prereqs.html#vmimport-instance-types)
    # in the VM Import/Export User Guide.
    property instance_type : InstanceType | Nil

    # The placement information for the instance.
    property placement : Placement | Nil

    # Indicates whether monitoring is enabled.
    property monitoring : Bool | Nil

    # [EC2-VPC] The ID of the subnet in which to launch the instance.
    property subnet_id : String | Nil

    # Indicates whether an instance stops or terminates when you initiate shutdown from the instance
    # (using the operating system command for system shutdown).
    property instance_initiated_shutdown_behavior : ShutdownBehavior | Nil

    # [EC2-VPC] An available IP address from the IP address range of the subnet.
    property private_ip_address : String | Nil

    def initialize(
      @architecture : ArchitectureValues | Nil = nil,
      @group_names : Array(String) | Nil = nil,
      @group_ids : Array(String) | Nil = nil,
      @additional_info : String | Nil = nil,
      @user_data : UserData | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @placement : Placement | Nil = nil,
      @monitoring : Bool | Nil = nil,
      @subnet_id : String | Nil = nil,
      @instance_initiated_shutdown_behavior : ShutdownBehavior | Nil = nil,
      @private_ip_address : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @architecture
        params << {"#{prefix}Architecture", value.to_json_object_key}
      end

      (@group_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}GroupName.#{i}", item}
      end

      (@group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}GroupId.#{i}", item}
      end

      if value = @additional_info
        params << {"#{prefix}AdditionalInfo", value}
      end

      if value = @user_data
        params.concat(value.to_query_params("#{prefix}UserData."))
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @placement
        params.concat(value.to_query_params("#{prefix}Placement."))
      end

      if value = @monitoring
        params << {"#{prefix}Monitoring", Core::QueryValue.bool(value)}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @instance_initiated_shutdown_behavior
        params << {"#{prefix}InstanceInitiatedShutdownBehavior", value.to_json_object_key}
      end

      if value = @private_ip_address
        params << {"#{prefix}PrivateIpAddress", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        architecture: (n = node.xpath_node("*[local-name()='architecture']")) ? AEC::ArchitectureValues.from_json_object_key?(n.content) : nil,
        group_names: node.xpath_nodes("*[local-name()='GroupName']/*[local-name()='SecurityGroup']").map { |n| n.content },
        group_ids: node.xpath_nodes("*[local-name()='GroupId']/*[local-name()='SecurityGroupId']").map { |n| n.content },
        additional_info: Core::XMLValue.string(node.xpath_node("*[local-name()='additionalInfo']")),
        user_data: node.xpath_node("*[local-name()='userData']").try { |n| UserData.from_xml(n) },
        instance_type: (n = node.xpath_node("*[local-name()='instanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        placement: node.xpath_node("*[local-name()='placement']").try { |n| Placement.from_xml(n) },
        monitoring: Core::XMLValue.bool(node.xpath_node("*[local-name()='monitoring']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        instance_initiated_shutdown_behavior: (n = node.xpath_node("*[local-name()='instanceInitiatedShutdownBehavior']")) ? AEC::ShutdownBehavior.from_json_object_key?(n.content) : nil,
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='privateIpAddress']")),
      )
    end

    def validate! : Nil
      if value = @user_data
        value.validate!
      end

      if value = @placement
        value.validate!
      end
    end

    def_equals_and_hash(@architecture, @group_names, @group_ids, @additional_info, @user_data, @instance_type, @placement, @monitoring, @subnet_id, @instance_initiated_shutdown_behavior, @private_ip_address)
  end
end
