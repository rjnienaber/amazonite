private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the instance type compatibility rules for an AMI, including lists of supported and
  # unsupported instance type patterns.
  class InstanceTypeSpecification
    # The instance types that the AMI supports.
    property supported_instance_types : Array(InstanceTypeItem) | Nil

    # The instance types that the AMI does not support.
    property unsupported_instance_types : Array(InstanceTypeItem) | Nil

    def initialize(
      @supported_instance_types : Array(InstanceTypeItem) | Nil = nil,
      @unsupported_instance_types : Array(InstanceTypeItem) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@supported_instance_types || [] of InstanceTypeItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SupportedInstanceTypeSet.#{i}."))
      end

      (@unsupported_instance_types || [] of InstanceTypeItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}UnsupportedInstanceTypeSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        supported_instance_types: node.xpath_nodes("*[local-name()='supportedInstanceTypeSet']/*[local-name()='item']").map { |n| InstanceTypeItem.from_xml(n) },
        unsupported_instance_types: node.xpath_nodes("*[local-name()='unsupportedInstanceTypeSet']/*[local-name()='item']").map { |n| InstanceTypeItem.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @supported_instance_types
        value.each(&.validate!)
      end

      if value = @unsupported_instance_types
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@supported_instance_types, @unsupported_instance_types)
  end
end
