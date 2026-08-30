private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetPatchBaselineRequest
    include JSON::Serializable

    # The ID of the patch baseline to retrieve.
    #
    # To retrieve information about an Amazon Web Services managed patch baseline, specify the full
    # Amazon Resource Name (ARN) of the baseline. For example, for the baseline
    # `AWS-AmazonLinuxDefaultPatchBaseline`, specify
    # `arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0e392de35e7c563b7` instead of
    # `pb-0e392de35e7c563b7`.
    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String

    def initialize(
      @baseline_id : String,
    )
    end

    def validate! : Nil
      if value = @baseline_id
        raise Core::ValidationError.new("BaselineId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("BaselineId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("BaselineId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-:/]{20,128}$"))
      end
    end

    def_equals_and_hash(@baseline_id)
  end
end
