private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the target groups to attach to a Spot Fleet. Spot Fleet registers the running Spot
  # Instances with these target groups.
  class TargetGroupsConfig
    # One or more target groups.
    property target_groups : Array(TargetGroup) | Nil

    def initialize(
      @target_groups : Array(TargetGroup) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@target_groups || [] of TargetGroup).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TargetGroups.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        target_groups: node.xpath_nodes("*[local-name()='targetGroups']/*[local-name()='item']").map { |n| TargetGroup.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @target_groups
        raise Core::ValidationError.new("TargetGroups must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("TargetGroups must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@target_groups)
  end
end
