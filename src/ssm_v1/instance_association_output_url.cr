private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # The URL of S3 bucket where you want to store the results of this request.
  class InstanceAssociationOutputUrl
    include JSON::Serializable

    # The URL of S3 bucket where you want to store the results of this request.
    @[JSON::Field(key: "S3OutputUrl")]
    property s3_output_url : S3OutputUrl | Nil

    def initialize(
      @s3_output_url : S3OutputUrl | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @s3_output_url
        value.validate!
      end
    end

    def_equals_and_hash(@s3_output_url)
  end
end
