private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyInstanceCpuOptionsResult
    # The ID of the instance that was updated.
    property instance_id : String | Nil

    # The number of CPU cores that are running for the specified instance after the update.
    property core_count : Int32 | Nil

    # The number of threads that are running per CPU core for the specified instance after the update.
    property threads_per_core : Int32 | Nil

    # Indicates whether nested virtualization has been enabled or disabled.
    property nested_virtualization : NestedVirtualizationSpecification | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @core_count : Int32 | Nil = nil,
      @threads_per_core : Int32 | Nil = nil,
      @nested_virtualization : NestedVirtualizationSpecification | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @core_count
        params << {"#{prefix}CoreCount", value.to_s}
      end

      if value = @threads_per_core
        params << {"#{prefix}ThreadsPerCore", value.to_s}
      end

      if value = @nested_virtualization
        params << {"#{prefix}NestedVirtualization", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        core_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='coreCount']")),
        threads_per_core: Core::XMLValue.i32(node.xpath_node("*[local-name()='threadsPerCore']")),
        nested_virtualization: (n = node.xpath_node("*[local-name()='nestedVirtualization']")) ? AEC::NestedVirtualizationSpecification.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @core_count, @threads_per_core, @nested_virtualization)
  end
end
