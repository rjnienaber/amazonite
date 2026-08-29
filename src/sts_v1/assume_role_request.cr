private alias Core = Amazonite::Core

module Amazonite::StsV1
  class AssumeRoleRequest
    property role_arn : String

    property role_session_name : String

    property policy_arns : Array(PolicyDescriptorType) | Nil

    property policy : String | Nil

    property duration_seconds : Int32 | Nil

    property tags : Array(Tag) | Nil

    property transitive_tag_keys : Array(String) | Nil

    property external_id : String | Nil

    property serial_number : String | Nil

    property token_code : String | Nil

    property source_identity : String | Nil

    property provided_contexts : Array(ProvidedContext) | Nil

    def initialize(
      @role_arn : String,
      @role_session_name : String,
      @policy_arns : Array(PolicyDescriptorType) | Nil = nil,
      @policy : String | Nil = nil,
      @duration_seconds : Int32 | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @transitive_tag_keys : Array(String) | Nil = nil,
      @external_id : String | Nil = nil,
      @serial_number : String | Nil = nil,
      @token_code : String | Nil = nil,
      @source_identity : String | Nil = nil,
      @provided_contexts : Array(ProvidedContext) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleArn", @role_arn}

      params << {"#{prefix}RoleSessionName", @role_session_name}

      (@policy_arns || [] of PolicyDescriptorType).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PolicyArns.member.#{i}."))
      end

      if value = @policy
        params << {"#{prefix}Policy", value}
      end

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end

      (@transitive_tag_keys || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}TransitiveTagKeys.member.#{i}", item}
      end

      if value = @external_id
        params << {"#{prefix}ExternalId", value}
      end

      if value = @serial_number
        params << {"#{prefix}SerialNumber", value}
      end

      if value = @token_code
        params << {"#{prefix}TokenCode", value}
      end

      if value = @source_identity
        params << {"#{prefix}SourceIdentity", value}
      end

      (@provided_contexts || [] of ProvidedContext).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ProvidedContexts.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleArn']")).not_nil!,
        role_session_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleSessionName']")).not_nil!,
        policy_arns: node.xpath_nodes("*[local-name()='PolicyArns']/*[local-name()='member']").map { |n| PolicyDescriptorType.from_xml(n) },
        policy: Core::XMLValue.string(node.xpath_node("*[local-name()='Policy']")),
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        transitive_tag_keys: node.xpath_nodes("*[local-name()='TransitiveTagKeys']/*[local-name()='member']").map { |n| n.content },
        external_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ExternalId']")),
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")),
        token_code: Core::XMLValue.string(node.xpath_node("*[local-name()='TokenCode']")),
        source_identity: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceIdentity']")),
        provided_contexts: node.xpath_nodes("*[local-name()='ProvidedContexts']/*[local-name()='member']").map { |n| ProvidedContext.from_xml(n) },
      )
    end
  end
end
