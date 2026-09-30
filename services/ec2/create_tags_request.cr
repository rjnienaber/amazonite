private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTagsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the resources, separated by spaces.
    #
    # Constraints: Up to 1000 resource IDs. We recommend breaking up this request into smaller
    # batches.
    property resources : Array(String) = [] of String

    # The tags. The `value` parameter is required, but if you don't want the tag to have a value,
    # specify the parameter with no value, and we set the value to an empty string.
    property tags : Array(Tag) = [] of Tag

    def initialize(
      @resources : Array(String),
      @tags : Array(Tag),
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      @resources.each_with_index(1) do |item, i|
        params << {"#{prefix}ResourceId.#{i}", item}
      end

      @tags.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tag.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        resources: node.xpath_nodes("*[local-name()='ResourceId']/*[local-name()='item']").map { |n| n.content },
        tags: node.xpath_nodes("*[local-name()='Tag']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @resources, @tags)
  end
end
