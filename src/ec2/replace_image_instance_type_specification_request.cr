private alias Core = Amazonite::Core

module Amazonite::EC2
  class ReplaceImageInstanceTypeSpecificationRequest
    # The ID of the AMI.
    property image_id : String

    # The instance type specification to set on the AMI. Omit this parameter to remove the existing
    # instance type specification.
    property instance_type_specification : InstanceTypeSpecificationRequest | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @image_id : String,
      @instance_type_specification : InstanceTypeSpecificationRequest | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ImageId", @image_id}

      if value = @instance_type_specification
        params.concat(value.to_query_params("#{prefix}InstanceTypeSpecification."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")).not_nil!,
        instance_type_specification: node.xpath_node("*[local-name()='InstanceTypeSpecification']").try { |n| InstanceTypeSpecificationRequest.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @instance_type_specification
        value.validate!
      end
    end

    def_equals_and_hash(@image_id, @instance_type_specification, @dry_run)
  end
end
