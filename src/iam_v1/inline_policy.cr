private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains an inline policy template that the service embeds in roles that you create from a role
  # template.
  class InlinePolicy
    # The name of the inline policy.
    property policy_name : String

    # The inline policy document.
    property policy_document : String

    def initialize(
      @policy_name : String,
      @policy_document : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicyName", @policy_name}

      params << {"#{prefix}PolicyDocument", @policy_document}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyName']")).not_nil!,
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyDocument']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @policy_name
        raise Core::ValidationError.new("PolicyName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PolicyName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("PolicyName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @policy_document
        raise Core::ValidationError.new("PolicyDocument length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PolicyDocument length must be <= 131072") if value.size > 131072
        raise Core::ValidationError.new("PolicyDocument does not match the required pattern") unless value.matches?(Regex.new("^[\\u0009\\u000A\\u000D\\u0020-\\u00FF]+$"))
      end
    end

    def_equals_and_hash(@policy_name, @policy_document)
  end
end
