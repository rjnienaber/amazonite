private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class RollbackStackInput
    property stack_name : String

    property role_arn : String | Nil

    property client_request_token : String | Nil

    property retain_except_on_create : Bool | Nil

    property deployment_config : DeploymentConfig | Nil

    def initialize(
      @stack_name : String,
      @role_arn : String | Nil = nil,
      @client_request_token : String | Nil = nil,
      @retain_except_on_create : Bool | Nil = nil,
      @deployment_config : DeploymentConfig | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

      if value = @role_arn
        params << {"#{prefix}RoleARN", value}
      end

      if value = @client_request_token
        params << {"#{prefix}ClientRequestToken", value}
      end

      if value = @retain_except_on_create
        params << {"#{prefix}RetainExceptOnCreate", Core::QueryValue.bool(value)}
      end

      if value = @deployment_config
        params.concat(value.to_query_params("#{prefix}DeploymentConfig."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleARN']")),
        client_request_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientRequestToken']")),
        retain_except_on_create: Core::XMLValue.bool(node.xpath_node("*[local-name()='RetainExceptOnCreate']")),
        deployment_config: node.xpath_node("*[local-name()='DeploymentConfig']").try { |n| DeploymentConfig.from_xml(n) },
      )
    end
  end
end
