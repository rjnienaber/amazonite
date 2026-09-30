private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisableApplicationStatusCheckSuppressionResult
    # The instances for which suppression was successfully disabled.
    property successful_results : Array(SuccessfulSuppressionResponseObject) | Nil

    # The instances for which suppression failed to be disabled.
    property unsuccessful_results : Array(UnsuccessfulSuppressionResponseObject) | Nil

    def initialize(
      @successful_results : Array(SuccessfulSuppressionResponseObject) | Nil = nil,
      @unsuccessful_results : Array(UnsuccessfulSuppressionResponseObject) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@successful_results || [] of SuccessfulSuppressionResponseObject).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SuccessfulResultSet.#{i}."))
      end

      (@unsuccessful_results || [] of UnsuccessfulSuppressionResponseObject).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}UnsuccessfulResultSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        successful_results: node.xpath_nodes("*[local-name()='successfulResultSet']/*[local-name()='item']").map { |n| SuccessfulSuppressionResponseObject.from_xml(n) },
        unsuccessful_results: node.xpath_nodes("*[local-name()='unsuccessfulResultSet']/*[local-name()='item']").map { |n| UnsuccessfulSuppressionResponseObject.from_xml(n) },
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
