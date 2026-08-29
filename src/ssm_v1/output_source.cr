module Amazonite::SsmV1
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
  end
end
