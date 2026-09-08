private alias Core = Amazonite::Core

module Amazonite::EC2
  # The capacity information for instances that can be launched onto the Dedicated Host.
  class AvailableCapacity
    # The number of instances that can be launched onto the Dedicated Host depending on the host's
    # available capacity. For Dedicated Hosts that support multiple instance types, this parameter
    # represents the number of instances for each instance size that is supported on the host.
    property available_instance_capacity : Array(InstanceCapacity) | Nil

    # The number of vCPUs available for launching instances onto the Dedicated Host.
    property available_v_cpus : Int32 | Nil

    def initialize(
      @available_instance_capacity : Array(InstanceCapacity) | Nil = nil,
      @available_v_cpus : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@available_instance_capacity || [] of InstanceCapacity).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AvailableInstanceCapacity.#{i}."))
      end

      if value = @available_v_cpus
        params << {"#{prefix}AvailableVCpus", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        available_instance_capacity: node.xpath_nodes("*[local-name()='availableInstanceCapacity']/*[local-name()='item']").map { |n| InstanceCapacity.from_xml(n) },
        available_v_cpus: Core::XMLValue.i32(node.xpath_node("*[local-name()='availableVCpus']")),
      )
    end

    def validate! : Nil
      if value = @available_instance_capacity
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@available_instance_capacity, @available_v_cpus)
  end
end
