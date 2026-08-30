private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Specifies the current source of the resource and the destination of where it will be moved to.
  class ResourceMapping
    # The source stack `StackName` and `LogicalResourceId` for the resource being refactored.
    property source : ResourceLocation

    # The destination stack `StackName` and `LogicalResourceId` for the resource being refactored.
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

    def validate! : Nil
      if value = @source
        value.validate!
      end

      if value = @destination
        value.validate!
      end
    end

    def_equals_and_hash(@source, @destination)
  end
end
