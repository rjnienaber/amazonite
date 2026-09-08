private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the volume initialization. For more information, see [Initialize Amazon EBS
  # volumes](https://docs.aws.amazon.com/ebs/latest/userguide/initalize-volume.html).
  class InitializationStatusDetails
    # The method used for volume initialization. Possible values include:
    #
    # - `default` - Volume initialized using the default volume initialization rate or fast snapshot
    # restore.
    #
    # - `provisioned-rate` - Volume initialized using an Amazon EBS Provisioned Rate for Volume
    # Initialization.
    #
    # - `volume-copy` - Volume copy initialized at the rate for volume copies.
    property initialization_type : InitializationType | Nil

    # The current volume initialization progress as a percentage (0-100). Returns `100` when volume
    # initialization has completed.
    property progress : Int64 | Nil

    # The estimated remaining time, in seconds, for volume initialization to complete. Returns `0`
    # when volume initialization has completed.
    #
    # Only available for volumes created with Amazon EBS Provisioned Rate for Volume Initialization.
    property estimated_time_to_complete_in_seconds : Int64 | Nil

    def initialize(
      @initialization_type : InitializationType | Nil = nil,
      @progress : Int64 | Nil = nil,
      @estimated_time_to_complete_in_seconds : Int64 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @initialization_type
        params << {"#{prefix}InitializationType", value.to_json_object_key}
      end

      if value = @progress
        params << {"#{prefix}Progress", value.to_s}
      end

      if value = @estimated_time_to_complete_in_seconds
        params << {"#{prefix}EstimatedTimeToCompleteInSeconds", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        initialization_type: (n = node.xpath_node("*[local-name()='initializationType']")) ? AEC::InitializationType.from_json_object_key?(n.content) : nil,
        progress: Core::XMLValue.i64(node.xpath_node("*[local-name()='progress']")),
        estimated_time_to_complete_in_seconds: Core::XMLValue.i64(node.xpath_node("*[local-name()='estimatedTimeToCompleteInSeconds']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@initialization_type, @progress, @estimated_time_to_complete_in_seconds)
  end
end
