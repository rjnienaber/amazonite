private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a prefix list ID.
  class PrefixListId
    # A description for the security group rule that references this prefix list ID.
    #
    # Constraints: Up to 255 characters in length. Allowed characters are a-z, A-Z, 0-9, spaces, and
    # ._-:/()#,@[]+=;{}!$*
    property description : String | Nil

    # The ID of the prefix.
    property prefix_list_id : String | Nil

    def initialize(
      @description : String | Nil = nil,
      @prefix_list_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @prefix_list_id
        params << {"#{prefix}PrefixListId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='prefixListId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@description, @prefix_list_id)
  end
end
