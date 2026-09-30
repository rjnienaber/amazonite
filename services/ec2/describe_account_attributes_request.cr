private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeAccountAttributesRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The account attribute names.
    property attribute_names : Array(AccountAttributeName) | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @attribute_names : Array(AccountAttributeName) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@attribute_names || [] of AccountAttributeName).each_with_index(1) do |item, i|
        params << {"#{prefix}AttributeName.#{i}", item.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        attribute_names: node.xpath_nodes("*[local-name()='attributeName']/*[local-name()='attributeName']").compact_map { |n| AEC::AccountAttributeName.from_json_object_key?(n.content) },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @attribute_names)
  end
end
