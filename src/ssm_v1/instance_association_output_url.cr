module Amazonite::SsmV1
  class InstanceAssociationOutputUrl
    include JSON::Serializable

    @[JSON::Field(key: "S3OutputUrl")]
    property s3_output_url : S3OutputUrl | Nil

    def initialize(
      @s3_output_url : S3OutputUrl | Nil = nil
    )
    end
  end
end
