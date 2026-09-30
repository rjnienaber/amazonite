private alias Core = Amazonite::Core

module Amazonite::EC2
  class ReplaceImageCriteriaInAllowedImagesSettingsRequest
    # The list of criteria that are evaluated to determine whether AMIs are discoverable and usable in
    # the account in the specified Amazon Web Services Region.
    property image_criteria : Array(ImageCriterionRequest) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @image_criteria : Array(ImageCriterionRequest) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@image_criteria || [] of ImageCriterionRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ImageCriterion.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_criteria: node.xpath_nodes("*[local-name()='ImageCriterion']/*[local-name()='ImageCriterion']").map { |n| ImageCriterionRequest.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @image_criteria
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@image_criteria, @dry_run)
  end
end
