private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about the reason that the operation failed.
  #
  # This data type is used as a response element in the
  # [GetOrganizationsAccessReport](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOrganizationsAccessReport.html),
  # [GetServiceLastAccessedDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetails.html),
  # and
  # [GetServiceLastAccessedDetailsWithEntities](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetailsWithEntities.html)
  # operations.
  class ErrorDetails
    # Detailed information about the reason that the operation failed.
    property message : String

    # The error code associated with the operation failure.
    property code : String

    def initialize(
      @message : String,
      @code : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Message", @message}

      params << {"#{prefix}Code", @code}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='Message']")).not_nil!,
        code: Core::XMLValue.string(node.xpath_node("*[local-name()='Code']")).not_nil!,
      )
    end
  end
end
