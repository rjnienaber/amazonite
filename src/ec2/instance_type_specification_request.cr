private alias Core = Amazonite::Core

module Amazonite::EC2
  # The instance type specification for an AMI, which contains lists of supported and unsupported
  # instance types that define which instance types are compatible with the AMI.
  class InstanceTypeSpecificationRequest
    # The instance types that the AMI supports. You can specify instance type names or use wildcard
    # patterns (for example, `t3.*`).
    #
    # Constraints: Maximum 100 entries. Each entry must be 1-24 characters and match the pattern
    # `^[A-Za-z0-9_.*-]+$`. Consecutive wildcard characters (`**`) are not allowed. Entries must be
    # unique within each list and across both lists; duplicate entries cause the request to fail.
    property supported_instance_types : Array(String) | Nil

    # The instance types that the AMI does not support. You can specify instance type names or use
    # wildcard patterns (for example, `t3.*`).
    #
    # Constraints: Maximum 100 entries. Each entry must be 1-24 characters and match the pattern
    # `^[A-Za-z0-9_.*-]+$`. Consecutive wildcard characters (`**`) are not allowed. Entries must be
    # unique within each list and across both lists; duplicate entries cause the request to fail.
    property unsupported_instance_types : Array(String) | Nil

    def initialize(
      @supported_instance_types : Array(String) | Nil = nil,
      @unsupported_instance_types : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@supported_instance_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SupportedInstanceType.#{i}", item}
      end

      (@unsupported_instance_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}UnsupportedInstanceType.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        supported_instance_types: node.xpath_nodes("*[local-name()='SupportedInstanceType']/*[local-name()='Item']").map { |n| n.content },
        unsupported_instance_types: node.xpath_nodes("*[local-name()='UnsupportedInstanceType']/*[local-name()='Item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @supported_instance_types
        raise Core::ValidationError.new("SupportedInstanceTypes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("SupportedInstanceTypes must have at most 100 item(s)") if value.size > 100
      end

      if value = @unsupported_instance_types
        raise Core::ValidationError.new("UnsupportedInstanceTypes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("UnsupportedInstanceTypes must have at most 100 item(s)") if value.size > 100
      end
    end

    def_equals_and_hash(@supported_instance_types, @unsupported_instance_types)
  end
end
