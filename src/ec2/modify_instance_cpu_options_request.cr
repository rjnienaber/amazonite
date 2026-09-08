private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyInstanceCpuOptionsRequest
    # The ID of the instance to update.
    property instance_id : String

    # The number of CPU cores to activate for the specified instance.
    property core_count : Int32 | Nil

    # The number of threads to run for each CPU core.
    property threads_per_core : Int32 | Nil

    # Indicates whether to enable or disable nested virtualization for the instance. When nested
    # virtualization is enabled, Virtual Secure Mode (VSM) is automatically disabled for the instance.
    property nested_virtualization : NestedVirtualizationSpecification | Nil

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @instance_id : String,
      @core_count : Int32 | Nil = nil,
      @threads_per_core : Int32 | Nil = nil,
      @nested_virtualization : NestedVirtualizationSpecification | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceId", @instance_id}

      if value = @core_count
        params << {"#{prefix}CoreCount", value.to_s}
      end

      if value = @threads_per_core
        params << {"#{prefix}ThreadsPerCore", value.to_s}
      end

      if value = @nested_virtualization
        params << {"#{prefix}NestedVirtualization", value.to_json_object_key}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")).not_nil!,
        core_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='CoreCount']")),
        threads_per_core: Core::XMLValue.i32(node.xpath_node("*[local-name()='ThreadsPerCore']")),
        nested_virtualization: (n = node.xpath_node("*[local-name()='NestedVirtualization']")) ? AEC::NestedVirtualizationSpecification.from_json_object_key?(n.content) : nil,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @core_count, @threads_per_core, @nested_virtualization, @dry_run)
  end
end
