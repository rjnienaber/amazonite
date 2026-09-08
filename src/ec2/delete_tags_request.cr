private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteTagsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the resources, separated by spaces.
    #
    # Constraints: Up to 1000 resource IDs. We recommend breaking up this request into smaller
    # batches.
    property resources : Array(String) = [] of String

    # The tags to delete. Specify a tag key and an optional tag value to delete specific tags. If you
    # specify a tag key without a tag value, we delete any tag with this key regardless of its value.
    # If you specify a tag key with an empty string as the tag value, we delete the tag only if its
    # value is an empty string.
    #
    # If you omit this parameter, we delete all user-defined tags for the specified resources. We do
    # not delete Amazon Web Services-generated tags (tags that have the `aws:` prefix).
    #
    # Constraints: Up to 1000 tags.
    property tags : Array(Tag) | Nil

    def initialize(
      @resources : Array(String),
      @dry_run : Bool | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
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

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tag.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        resources: node.xpath_nodes("*[local-name()='resourceId']/*[local-name()='item']").map { |n| n.content },
        tags: node.xpath_nodes("*[local-name()='tag']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
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
