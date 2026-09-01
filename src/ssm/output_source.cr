private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Information about the source where the association execution details are stored.
  class OutputSource
    include JSON::Serializable

    # The ID of the output source, for example the URL of an S3 bucket.
    @[JSON::Field(key: "OutputSourceId")]
    property output_source_id : String | Nil

    # The type of source where the association execution details are stored, for example, Amazon S3.
    @[JSON::Field(key: "OutputSourceType")]
    property output_source_type : String | Nil

    def initialize(
      @output_source_id : String | Nil = nil,
      @output_source_type : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @output_source_id
        raise Core::ValidationError.new("OutputSourceId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("OutputSourceId length must be <= 36") if value.size > 36
      end
    end

    def_equals_and_hash(@output_source_id, @output_source_type)
  end
end
