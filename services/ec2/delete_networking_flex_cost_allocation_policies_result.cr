private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteNetworkingFlexCostAllocationPoliciesResult
    # The IDs of the policies that were successfully deleted.
    property successful : Array(String) | Nil

    # Information about the policies that could not be deleted.
    property failed : Array(FlexCostAllocationOperationFailure) | Nil

    def initialize(
      @successful : Array(String) | Nil = nil,
      @failed : Array(FlexCostAllocationOperationFailure) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@successful || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Successful.#{i}", item}
      end

      (@failed || [] of FlexCostAllocationOperationFailure).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Failed.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        successful: node.xpath_nodes("*[local-name()='successful']/*[local-name()='item']").map { |n| n.content },
        failed: node.xpath_nodes("*[local-name()='failed']/*[local-name()='item']").map { |n| FlexCostAllocationOperationFailure.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @successful
        raise Core::ValidationError.new("Successful must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Successful must have at most 50 item(s)") if value.size > 50
      end

      if value = @failed
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@successful, @failed)
  end
end
