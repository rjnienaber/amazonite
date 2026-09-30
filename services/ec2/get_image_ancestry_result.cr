private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetImageAncestryResult
    # A list of entries in the AMI ancestry chain, from the specified AMI to the root AMI.
    property image_ancestry_entries : Array(ImageAncestryEntry) | Nil

    def initialize(
      @image_ancestry_entries : Array(ImageAncestryEntry) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@image_ancestry_entries || [] of ImageAncestryEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ImageAncestryEntrySet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_ancestry_entries: node.xpath_nodes("*[local-name()='imageAncestryEntrySet']/*[local-name()='item']").map { |n| ImageAncestryEntry.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @image_ancestry_entries
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@image_ancestry_entries)
  end
end
