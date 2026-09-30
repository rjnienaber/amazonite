private alias Core = Amazonite::Core

module Amazonite::EC2
  # Configuration settings for creating and managing pre-provisioned snapshots for a Windows fast
  # launch enabled Windows AMI.
  class FastLaunchSnapshotConfigurationResponse
    # The number of pre-provisioned snapshots requested to keep on hand for a Windows fast launch
    # enabled AMI.
    property target_resource_count : Int32 | Nil

    def initialize(
      @target_resource_count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @target_resource_count
        params << {"#{prefix}TargetResourceCount", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        target_resource_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='targetResourceCount']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@target_resource_count)
  end
end
