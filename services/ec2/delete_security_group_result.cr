private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteSecurityGroupResult
    # Returns `true` if the request succeeds; otherwise, returns an error.
    property return : Bool | Nil

    # The ID of the deleted security group.
    property group_id : String | Nil

    def initialize(
      @return : Bool | Nil = nil,
      @group_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @return
        params << {"#{prefix}Return", Core::QueryValue.bool(value)}
      end

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        return: Core::XMLValue.bool(node.xpath_node("*[local-name()='return']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@return, @group_id)
  end
end
