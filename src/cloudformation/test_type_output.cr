private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class TestTypeOutput
    # The Amazon Resource Name (ARN) of the extension.
    property type_version_arn : String | Nil

    def initialize(
      @type_version_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type_version_arn
        params << {"#{prefix}TypeVersionArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type_version_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeVersionArn']")),
      )
    end

    def validate! : Nil
      if value = @type_version_arn
        raise Core::ValidationError.new("TypeVersionArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("TypeVersionArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("TypeVersionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/.+$"))
      end
    end

    def_equals_and_hash(@type_version_arn)
  end
end
