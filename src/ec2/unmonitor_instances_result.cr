private alias Core = Amazonite::Core

module Amazonite::EC2
  class UnmonitorInstancesResult
    # The monitoring information.
    property instance_monitorings : Array(InstanceMonitoring) | Nil

    def initialize(
      @instance_monitorings : Array(InstanceMonitoring) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instance_monitorings || [] of InstanceMonitoring).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstancesSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_monitorings: node.xpath_nodes("*[local-name()='instancesSet']/*[local-name()='item']").map { |n| InstanceMonitoring.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @instance_monitorings
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_monitorings)
  end
end
