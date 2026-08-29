private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DeleteStackInput
    property stack_name : String

    property retain_resources : Array(String) | Nil

    property role_arn : String | Nil

    property client_request_token : String | Nil

    property deletion_mode : DeletionMode | Nil

    property deployment_config : DeploymentConfig | Nil

    def initialize(
      @stack_name : String,
      @retain_resources : Array(String) | Nil = nil,
      @role_arn : String | Nil = nil,
      @client_request_token : String | Nil = nil,
      @deletion_mode : DeletionMode | Nil = nil,
      @deployment_config : DeploymentConfig | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

      (@retain_resources || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RetainResources.member.#{i}", item}
      end

      if value = @role_arn
        params << {"#{prefix}RoleARN", value}
      end

      if value = @client_request_token
        params << {"#{prefix}ClientRequestToken", value}
      end

      if value = @deletion_mode
        params << {"#{prefix}DeletionMode", value.to_json_object_key}
      end

      if value = @deployment_config
        params.concat(value.to_query_params("#{prefix}DeploymentConfig."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        retain_resources: node.xpath_nodes("*[local-name()='RetainResources']/*[local-name()='member']").map { |n| n.content },
        role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleARN']")),
        client_request_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientRequestToken']")),
        deletion_mode: (n = node.xpath_node("*[local-name()='DeletionMode']")) ? ACF::DeletionMode.from_json_object_key?(n.content) : nil,
        deployment_config: node.xpath_node("*[local-name()='DeploymentConfig']").try { |n| DeploymentConfig.from_xml(n) },
      )
    end
  end
end
