private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the properties of a Dedicated Host.
  class HostProperties
    # The number of cores on the Dedicated Host.
    property cores : Int32 | Nil

    # The instance type supported by the Dedicated Host. For example, `m5.large`. If the host supports
    # multiple instance types, no **instanceType** is returned.
    property instance_type : String | Nil

    # The instance family supported by the Dedicated Host. For example, `m5`.
    property instance_family : String | Nil

    # The number of sockets on the Dedicated Host.
    property sockets : Int32 | Nil

    # The total number of vCPUs on the Dedicated Host.
    property total_v_cpus : Int32 | Nil

    def initialize(
      @cores : Int32 | Nil = nil,
      @instance_type : String | Nil = nil,
      @instance_family : String | Nil = nil,
      @sockets : Int32 | Nil = nil,
      @total_v_cpus : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cores
        params << {"#{prefix}Cores", value.to_s}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @instance_family
        params << {"#{prefix}InstanceFamily", value}
      end

      if value = @sockets
        params << {"#{prefix}Sockets", value.to_s}
      end

      if value = @total_v_cpus
        params << {"#{prefix}TotalVCpus", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cores: Core::XMLValue.i32(node.xpath_node("*[local-name()='cores']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        instance_family: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceFamily']")),
        sockets: Core::XMLValue.i32(node.xpath_node("*[local-name()='sockets']")),
        total_v_cpus: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalVCpus']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cores, @instance_type, @instance_family, @sockets, @total_v_cpus)
  end
end
