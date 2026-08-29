module Amazonite::SsmV1
  class LabelParameterVersionResult
    include JSON::Serializable

    # The label doesn't meet the requirements. For information about parameter label requirements, see
    # [Working with parameter
    # labels](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-labels.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "InvalidLabels")]
    property invalid_labels : Array(String) | Nil

    # The version of the parameter that has been labeled.
    @[JSON::Field(key: "ParameterVersion")]
    property parameter_version : Int64 | Nil

    def initialize(
      @invalid_labels : Array(String) | Nil = nil,
      @parameter_version : Int64 | Nil = nil,
    )
    end
  end
end
