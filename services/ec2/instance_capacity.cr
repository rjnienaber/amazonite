private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the number of instances that can be launched onto the Dedicated Host.
  class InstanceCapacity
    # The number of instances that can be launched onto the Dedicated Host based on the host's
    # available capacity.
    property available_capacity : Int32 | Nil

    # The instance type supported by the Dedicated Host.
    property instance_type : String | Nil

    # The total number of instances that can be launched onto the Dedicated Host if there are no
    # instances running on it.
    property total_capacity : Int32 | Nil

    def initialize(
      @available_capacity : Int32 | Nil = nil,
      @instance_type : String | Nil = nil,
      @total_capacity : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @available_capacity
        params << {"#{prefix}AvailableCapacity", value.to_s}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @total_capacity
        params << {"#{prefix}TotalCapacity", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        available_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='availableCapacity']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        total_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalCapacity']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@available_capacity, @instance_type, @total_capacity)
  end
end
