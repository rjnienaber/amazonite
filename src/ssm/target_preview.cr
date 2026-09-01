module Amazonite::Ssm
  # Information about the resources that would be included in the actual runbook execution, if it
  # were to be run.
  class TargetPreview
    include JSON::Serializable

    # The number of resources of a certain type included in an execution preview.
    @[JSON::Field(key: "Count")]
    property count : Int32 | Nil

    # A type of resource that was included in the execution preview.
    @[JSON::Field(key: "TargetType")]
    property target_type : String | Nil

    def initialize(
      @count : Int32 | Nil = nil,
      @target_type : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@count, @target_type)
  end
end
