private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyDefaultCreditSpecificationResult
    # The default credit option for CPU usage of the instance family.
    property instance_family_credit_specification : InstanceFamilyCreditSpecification | Nil

    def initialize(
      @instance_family_credit_specification : InstanceFamilyCreditSpecification | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_family_credit_specification
        params.concat(value.to_query_params("#{prefix}InstanceFamilyCreditSpecification."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_family_credit_specification: node.xpath_node("*[local-name()='instanceFamilyCreditSpecification']").try { |n| InstanceFamilyCreditSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @instance_family_credit_specification
        value.validate!
      end
    end

    def_equals_and_hash(@instance_family_credit_specification)
  end
end
