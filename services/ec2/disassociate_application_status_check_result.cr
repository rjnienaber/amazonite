private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateApplicationStatusCheckResult
    # The associations that were successfully removed.
    property successful_results : Array(SuccessfulAssociationResponseObject) | Nil

    # The associations that failed to be removed.
    property unsuccessful_results : Array(UnsuccessfulAssociationResponseObject) | Nil

    def initialize(
      @successful_results : Array(SuccessfulAssociationResponseObject) | Nil = nil,
      @unsuccessful_results : Array(UnsuccessfulAssociationResponseObject) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@successful_results || [] of SuccessfulAssociationResponseObject).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SuccessfulResultSet.#{i}."))
      end

      (@unsuccessful_results || [] of UnsuccessfulAssociationResponseObject).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}UnsuccessfulResultSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        successful_results: node.xpath_nodes("*[local-name()='successfulResultSet']/*[local-name()='item']").map { |n| SuccessfulAssociationResponseObject.from_xml(n) },
        unsuccessful_results: node.xpath_nodes("*[local-name()='unsuccessfulResultSet']/*[local-name()='item']").map { |n| UnsuccessfulAssociationResponseObject.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @successful_results
        value.each(&.validate!)
      end

      if value = @unsuccessful_results
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@successful_results, @unsuccessful_results)
  end
end
