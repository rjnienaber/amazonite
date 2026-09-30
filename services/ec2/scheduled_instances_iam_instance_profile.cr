private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an IAM instance profile for a Scheduled Instance.
  class ScheduledInstancesIamInstanceProfile
    # The Amazon Resource Name (ARN).
    property arn : String | Nil

    # The name.
    property name : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@arn, @name)
  end
end
