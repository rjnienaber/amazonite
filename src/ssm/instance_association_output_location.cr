private alias Core = Amazonite::Core

module Amazonite::Ssm
  # An S3 bucket where you want to store the results of this request.
  #
  # For the minimal permissions required to enable Amazon S3 output for an association, see [Create
  # an association
  # (console)](https://docs.aws.amazon.com/systems-manager/latest/userguide/state-manager-associations-creating.html#state-manager-associations-console)
  # in the *Systems Manager User Guide*.
  class InstanceAssociationOutputLocation
    include JSON::Serializable

    # An S3 bucket where you want to store the results of this request.
    @[JSON::Field(key: "S3Location")]
    property s3_location : S3OutputLocation | Nil

    def initialize(
      @s3_location : S3OutputLocation | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @s3_location
        value.validate!
      end
    end

    def_equals_and_hash(@s3_location)
  end
end
