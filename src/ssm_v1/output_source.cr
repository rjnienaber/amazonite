module Amazonite::SsmV1
  class OutputSource
    include JSON::Serializable

    @[JSON::Field(key: "OutputSourceId")]
    property output_source_id : String | Nil

    @[JSON::Field(key: "OutputSourceType")]
    property output_source_type : String | Nil

    def initialize(
      @output_source_id : String | Nil = nil,
      @output_source_type : String | Nil = nil
    )
    end
  end
end
