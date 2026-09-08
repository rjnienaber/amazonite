private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeReservedInstancesModifications.
  class DescribeReservedInstancesModificationsRequest
    # IDs for the submitted modification request.
    property reserved_instances_modification_ids : Array(String) | Nil

    # The token to retrieve the next page of results.
    property next_token : String | Nil

    # One or more filters.
    #
    # - `client-token` - The idempotency token for the modification request.
    #
    # - `create-date` - The time when the modification request was created.
    #
    # - `effective-date` - The time when the modification becomes effective.
    #
    # - `modification-result.reserved-instances-id` - The ID for the Reserved Instances created as
    # part of the modification request. This ID is only available when the status of the modification
    # is `fulfilled`.
    #
    # - `modification-result.target-configuration.availability-zone` - The Availability Zone for the
    # new Reserved Instances.
    #
    # - `modification-result.target-configuration.availability-zone-id` - The ID of the Availability
    # Zone for the new Reserved Instances.
    #
    # - `modification-result.target-configuration.instance-count ` - The number of new Reserved
    # Instances.
    #
    # - `modification-result.target-configuration.instance-type` - The instance type of the new
    # Reserved Instances.
    #
    # - `reserved-instances-id` - The ID of the Reserved Instances modified.
    #
    # - `reserved-instances-modification-id` - The ID of the modification request.
    #
    # - `status` - The status of the Reserved Instances modification request (`processing` |
    # `fulfilled` | `failed`).
    #
    # - `status-message` - The reason for the status.
    #
    # - `update-date` - The time when the modification request was last updated.
    property filters : Array(Filter) | Nil

    def initialize(
      @reserved_instances_modification_ids : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@reserved_instances_modification_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ReservedInstancesModificationId.#{i}", item}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reserved_instances_modification_ids: node.xpath_nodes("*[local-name()='ReservedInstancesModificationId']/*[local-name()='ReservedInstancesModificationId']").map { |n| n.content },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@reserved_instances_modification_ids, @next_token, @filters)
  end
end
