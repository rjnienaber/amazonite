private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeInstanceEventNotificationAttributesResult
    # Information about the registered tag keys.
    property instance_tag_attribute : InstanceTagNotificationAttribute | Nil

    def initialize(
      @instance_tag_attribute : InstanceTagNotificationAttribute | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_tag_attribute
        params.concat(value.to_query_params("#{prefix}InstanceTagAttribute."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_tag_attribute: node.xpath_node("*[local-name()='instanceTagAttribute']").try { |n| InstanceTagNotificationAttribute.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @instance_tag_attribute
        value.validate!
      end
    end

    def_equals_and_hash(@instance_tag_attribute)
  end
end
