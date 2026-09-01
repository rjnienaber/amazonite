private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class PublishTypeOutput
    # The Amazon Resource Name (ARN) assigned to the public extension upon publication.
    property public_type_arn : String | Nil

    def initialize(
      @public_type_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @public_type_arn
        params << {"#{prefix}PublicTypeArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        public_type_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicTypeArn']")),
      )
    end

    def validate! : Nil
      if value = @public_type_arn
        raise Core::ValidationError.new("PublicTypeArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("PublicTypeArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("PublicTypeArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/.+$"))
      end
    end

    def_equals_and_hash(@public_type_arn)
  end
end
