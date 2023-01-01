module Amazonite::SsmV1
  class InstanceAssociationOutputLocation
    include JSON::Serializable

    @[JSON::Field(key: "S3Location")]
    property s3_location : S3OutputLocation | Nil

    def initialize(
      @s3_location : S3OutputLocation | Nil = nil
    )
    end
  end
end
