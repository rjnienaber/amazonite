module Amazonite::SsmV1
  class S3OutputUrl
    include JSON::Serializable

    @[JSON::Field(key: "OutputUrl")]
    property output_url : String | Nil

    def initialize(
      @output_url : String | Nil = nil
    )
    end
  end
end
