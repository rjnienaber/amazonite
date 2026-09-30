private alias Core = Amazonite::Core

module Amazonite::Iam
  class GenerateServiceLastAccessedDetailsResponse
    # The `JobId` that you can use in the
    # [GetServiceLastAccessedDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetails.html)
    # or
    # [GetServiceLastAccessedDetailsWithEntities](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetailsWithEntities.html)
    # operations. The `JobId` returned by `GenerateServiceLastAccessedDetail` must be used by the same
    # role within a session, or by the same user when used to call `GetServiceLastAccessedDetail`.
    property job_id : String | Nil

    def initialize(
      @job_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @job_id
        params << {"#{prefix}JobId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        job_id: Core::XMLValue.string(node.xpath_node("*[local-name()='JobId']")),
      )
    end

    def validate! : Nil
      if value = @job_id
        raise Core::ValidationError.new("JobId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("JobId length must be <= 36") if value.size > 36
      end
    end

    def_equals_and_hash(@job_id)
  end
end
