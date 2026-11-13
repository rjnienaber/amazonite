private alias Core = Amazonite::Core

module Amazonite::EC2
  class MonitorInstancesRequest
    # The IDs of the instances.
    property instance_ids : Array(String) = [] of String

    # The IDs of the metric categories to associate with the instances. The specified metric
    # categories are added to any metric categories that are already associated with the instances.
    property metric_category_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @instance_ids : Array(String),
      @metric_category_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @instance_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceId.#{i}", item}
      end

      (@metric_category_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}MetricCategoryId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_ids: node.xpath_nodes("*[local-name()='InstanceId']/*[local-name()='InstanceId']").map { |n| n.content },
        metric_category_ids: node.xpath_nodes("*[local-name()='MetricCategoryId']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_ids, @metric_category_ids, @dry_run)
  end
end
