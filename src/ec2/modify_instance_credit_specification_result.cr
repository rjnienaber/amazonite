private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyInstanceCreditSpecificationResult
    # Information about the instances whose credit option for CPU usage was successfully modified.
    property successful_instance_credit_specifications : Array(SuccessfulInstanceCreditSpecificationItem) | Nil

    # Information about the instances whose credit option for CPU usage was not modified.
    property unsuccessful_instance_credit_specifications : Array(UnsuccessfulInstanceCreditSpecificationItem) | Nil

    def initialize(
      @successful_instance_credit_specifications : Array(SuccessfulInstanceCreditSpecificationItem) | Nil = nil,
      @unsuccessful_instance_credit_specifications : Array(UnsuccessfulInstanceCreditSpecificationItem) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@successful_instance_credit_specifications || [] of SuccessfulInstanceCreditSpecificationItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SuccessfulInstanceCreditSpecificationSet.#{i}."))
      end

      (@unsuccessful_instance_credit_specifications || [] of UnsuccessfulInstanceCreditSpecificationItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}UnsuccessfulInstanceCreditSpecificationSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        successful_instance_credit_specifications: node.xpath_nodes("*[local-name()='successfulInstanceCreditSpecificationSet']/*[local-name()='item']").map { |n| SuccessfulInstanceCreditSpecificationItem.from_xml(n) },
        unsuccessful_instance_credit_specifications: node.xpath_nodes("*[local-name()='unsuccessfulInstanceCreditSpecificationSet']/*[local-name()='item']").map { |n| UnsuccessfulInstanceCreditSpecificationItem.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @successful_instance_credit_specifications
        value.each(&.validate!)
      end

      if value = @unsuccessful_instance_credit_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@successful_instance_credit_specifications, @unsuccessful_instance_credit_specifications)
  end
end
