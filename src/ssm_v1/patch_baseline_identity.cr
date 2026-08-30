private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Defines the basic information about a patch baseline.
  class PatchBaselineIdentity
    include JSON::Serializable

    # The ID of the patch baseline.
    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String | Nil

    # The name of the patch baseline.
    @[JSON::Field(key: "BaselineName")]
    property baseline_name : String | Nil

    # Defines the operating system the patch baseline applies to. The default value is `WINDOWS`.
    @[JSON::Field(key: "OperatingSystem", converter: AS::OperatingSystem)]
    property operating_system : OperatingSystem | Nil

    # The description of the patch baseline.
    @[JSON::Field(key: "BaselineDescription")]
    property baseline_description : String | Nil

    # Indicates whether this is the default baseline. Amazon Web Services Systems Manager supports
    # creating multiple default patch baselines. For example, you can create a default patch baseline
    # for each operating system.
    @[JSON::Field(key: "DefaultBaseline")]
    property default_baseline : Bool | Nil

    def initialize(
      @baseline_id : String | Nil = nil,
      @baseline_name : String | Nil = nil,
      @operating_system : OperatingSystem | Nil = nil,
      @baseline_description : String | Nil = nil,
      @default_baseline : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @baseline_id
        raise Core::ValidationError.new("BaselineId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("BaselineId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("BaselineId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-:/]{20,128}$"))
      end

      if value = @baseline_name
        raise Core::ValidationError.new("BaselineName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("BaselineName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("BaselineName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @baseline_description
        raise Core::ValidationError.new("BaselineDescription length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("BaselineDescription length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@baseline_id, @baseline_name, @operating_system, @baseline_description, @default_baseline)
  end
end
