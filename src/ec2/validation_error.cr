private alias Core = Amazonite::Core

module Amazonite::EC2
  # The error code and error message that is returned for a parameter or parameter combination that
  # is not valid when a new launch template or new version of a launch template is created.
  class ValidationError
    # The error code that indicates why the parameter or parameter combination is not valid. For more
    # information about error codes, see [Error
    # codes](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/errors-overview.html).
    property code : String | Nil

    # The error message that describes why the parameter or parameter combination is not valid. For
    # more information about error messages, see [Error
    # codes](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/errors-overview.html).
    property message : String | Nil

    def initialize(
      @code : String | Nil = nil,
      @message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @code
        params << {"#{prefix}Code", value}
      end

      if value = @message
        params << {"#{prefix}Message", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        code: Core::XMLValue.string(node.xpath_node("*[local-name()='code']")),
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='message']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@code, @message)
  end
end
