module Amazonite::EC2
  # Contains the output of RunScheduledInstances.
  class RunScheduledInstancesResult
    # The IDs of the newly launched instances.
    property instance_id_set : Array(String) | Nil

    def initialize(
      @instance_id_set : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instance_id_set || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceIdSet.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id_set: node.xpath_nodes("*[local-name()='instanceIdSet']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id_set)
  end
end
