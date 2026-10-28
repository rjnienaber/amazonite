private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetImageFindingsResult
    # The Amazon Inspector findings for the AMI.
    property image_findings : Array(ImageFinding) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @image_findings : Array(ImageFinding) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@image_findings || [] of ImageFinding).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ImageFindingSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_findings: node.xpath_nodes("*[local-name()='imageFindingSet']/*[local-name()='item']").map { |n| ImageFinding.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @image_findings
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@image_findings, @next_token)
  end
end
