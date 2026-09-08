private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteApplicationStatusCheckResult
    # Information about the deleted application status check.
    property application_status_check : ApplicationStatusCheckResponseObject | Nil

    def initialize(
      @application_status_check : ApplicationStatusCheckResponseObject | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @application_status_check
        params.concat(value.to_query_params("#{prefix}ApplicationStatusCheck."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        application_status_check: node.xpath_node("*[local-name()='applicationStatusCheck']").try { |n| ApplicationStatusCheckResponseObject.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @application_status_check
        value.validate!
      end
    end

    def_equals_and_hash(@application_status_check)
  end
end
