private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Contains the progress detail for a single Region of a StackSet operation. This information is
  # returned only by DescribeStackSetOperation.
  class RegionalStatusDetail
    # The progress information for the individual stages of the operation in this Region.
    property stages : RegionalStages | Nil

    def initialize(
      @stages : RegionalStages | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stages
        params.concat(value.to_query_params("#{prefix}Stages."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stages: node.xpath_node("*[local-name()='Stages']").try { |n| RegionalStages.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @stages
        value.validate!
      end
    end

    def_equals_and_hash(@stages)
  end
end
