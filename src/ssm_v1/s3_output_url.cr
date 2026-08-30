module Amazonite::SsmV1
  # A URL for the Amazon Web Services Systems Manager (Systems Manager) bucket where you want to
  # store the results of this request.
  class S3OutputUrl
    include JSON::Serializable

    # A URL for an S3 bucket where you want to store the results of this request.
    @[JSON::Field(key: "OutputUrl")]
    property output_url : String | Nil

    def initialize(
      @output_url : String | Nil = nil,
    )
    end

    def_equals_and_hash(@output_url)
  end
end
