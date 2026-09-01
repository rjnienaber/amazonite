private alias Core = Amazonite::Core

module Amazonite::Lambda
  # An [Lambda layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
  class Layer
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the function layer.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # The size of the layer archive in bytes.
    @[JSON::Field(key: "CodeSize")]
    property code_size : Int64 | Nil

    # The Amazon Resource Name (ARN) for a signing profile version.
    @[JSON::Field(key: "SigningProfileVersionArn")]
    property signing_profile_version_arn : String | Nil

    # The Amazon Resource Name (ARN) of a signing job.
    @[JSON::Field(key: "SigningJobArn")]
    property signing_job_arn : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @code_size : Int64 | Nil = nil,
      @signing_profile_version_arn : String | Nil = nil,
      @signing_job_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("Arn does not match the required pattern") unless value.matches?(Regex.new("^((arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:layer:[a-zA-Z0-9-_]+:[0-9]+)|(arn:[a-zA-Z0-9-]+:lambda:::awslayer:[a-zA-Z0-9-_]+))$"))
      end

      if value = @signing_profile_version_arn
        raise Core::ValidationError.new("SigningProfileVersionArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("SigningProfileVersionArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("SigningProfileVersionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z0-9-]*):([a-zA-Z0-9\\-])+:((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1})?:(\\d{12})?:(.*)$"))
      end

      if value = @signing_job_arn
        raise Core::ValidationError.new("SigningJobArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("SigningJobArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("SigningJobArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z0-9-]*):([a-zA-Z0-9\\-])+:((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1})?:(\\d{12})?:(.*)$"))
      end
    end

    def_equals_and_hash(@arn, @code_size, @signing_profile_version_arn, @signing_job_arn)
  end
end
