private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateServiceLinkedRoleRequest
    property aws_service_name : String

    property description : String | Nil

    property custom_suffix : String | Nil

    def initialize(
      @aws_service_name : String,
      @description : String | Nil = nil,
      @custom_suffix : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}AWSServiceName", @aws_service_name}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @custom_suffix
        params << {"#{prefix}CustomSuffix", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        aws_service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='AWSServiceName']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        custom_suffix: Core::XMLValue.string(node.xpath_node("*[local-name()='CustomSuffix']")),
      )
    end
  end
end
