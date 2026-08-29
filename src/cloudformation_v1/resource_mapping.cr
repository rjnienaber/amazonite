module Amazonite::CloudFormationV1
  class ResourceMapping
    property source : ResourceLocation

    property destination : ResourceLocation

    def initialize(
      @source : ResourceLocation,
      @destination : ResourceLocation,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@source.to_query_params("#{prefix}Source."))

      params.concat(@destination.to_query_params("#{prefix}Destination."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source: node.xpath_node("*[local-name()='Source']").try { |n| ResourceLocation.from_xml(n) }.not_nil!,
        destination: node.xpath_node("*[local-name()='Destination']").try { |n| ResourceLocation.from_xml(n) }.not_nil!,
      )
    end
  end
end
