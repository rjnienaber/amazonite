private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an IAM instance profile.
  class IamInstanceProfile
    # The Amazon Resource Name (ARN) of the instance profile.
    property arn : String | Nil

    # The ID of the instance profile.
    property id : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @id
        params << {"#{prefix}Id", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='arn']")),
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='id']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@arn, @id)
  end
end
