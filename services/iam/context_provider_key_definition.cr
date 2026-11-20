private alias Core = Amazonite::Core

module Amazonite::Iam
  # Defines a single mapping from a source key in the external identity provider's assertion or
  # token to a target trusted context key.
  #
  # This data type is used as a member of the
  # [ContextProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ContextProvider.html)
  # data type.
  class ContextProviderKeyDefinition
    # The key in the external identity provider's assertion or token to read the value from.
    #
    # The key can contain only ASCII letters (A-Z, a-z), numbers (0-9), single spaces, and the
    # following characters: `_ . : / = + - @ #`. It can't start or end with a space or contain two
    # spaces in a row.
    property source_key : String

    # The trusted context key to map the source value into.
    #
    # The key can contain only ASCII letters (A-Z, a-z), numbers (0-9), single spaces, and the
    # following characters: `_ . : / = + - @ #`. It can't start or end with a space or contain two
    # spaces in a row.
    property target_key : String | Nil

    def initialize(
      @source_key : String,
      @target_key : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SourceKey", @source_key}

      if value = @target_key
        params << {"#{prefix}TargetKey", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source_key: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceKey']")).not_nil!,
        target_key: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetKey']")),
      )
    end

    def validate! : Nil
      if value = @source_key
        raise Core::ValidationError.new("SourceKey length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SourceKey length must be <= 128") if value.size > 128
      end

      if value = @target_key
        raise Core::ValidationError.new("TargetKey length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TargetKey length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@source_key, @target_key)
  end
end
