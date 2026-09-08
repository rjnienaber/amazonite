private alias Core = Amazonite::Core

module Amazonite::EC2
  class UpdateCapacityManagerMonitoredTagKeysResult
    # The list of tag keys affected by the update, including their current status and metadata.
    property capacity_manager_tag_keys : Array(CapacityManagerMonitoredTagKey) | Nil

    def initialize(
      @capacity_manager_tag_keys : Array(CapacityManagerMonitoredTagKey) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@capacity_manager_tag_keys || [] of CapacityManagerMonitoredTagKey).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CapacityManagerTagKeySet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_manager_tag_keys: node.xpath_nodes("*[local-name()='capacityManagerTagKeySet']/*[local-name()='item']").map { |n| CapacityManagerMonitoredTagKey.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @capacity_manager_tag_keys
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_manager_tag_keys)
  end
end
