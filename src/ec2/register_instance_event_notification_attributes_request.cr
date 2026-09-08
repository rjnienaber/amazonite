private alias Core = Amazonite::Core

module Amazonite::EC2
  class RegisterInstanceEventNotificationAttributesRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Information about the tag keys to register.
    property instance_tag_attribute : RegisterInstanceTagAttributeRequest

    def initialize(
      @instance_tag_attribute : RegisterInstanceTagAttributeRequest,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params.concat(@instance_tag_attribute.to_query_params("#{prefix}InstanceTagAttribute."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        instance_tag_attribute: node.xpath_node("*[local-name()='InstanceTagAttribute']").try { |n| RegisterInstanceTagAttributeRequest.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @instance_tag_attribute
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run, @instance_tag_attribute)
  end
end
