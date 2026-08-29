private alias Core = Amazonite::Core

module Amazonite::StsV1
  class AssumedRoleUser
    property assumed_role_id : String

    property arn : String

    def initialize(
      @assumed_role_id : String,
      @arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}AssumedRoleId", @assumed_role_id}

      params << {"#{prefix}Arn", @arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        assumed_role_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AssumedRoleId']")).not_nil!,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
      )
    end
  end
end
