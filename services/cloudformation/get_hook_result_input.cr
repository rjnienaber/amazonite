private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class GetHookResultInput
    # The unique identifier (ID) of the Hook invocation result that you want details about. You can
    # get the ID from the
    # [ListHookResults](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ListHookResults.html)
    # operation.
    property hook_result_id : String | Nil

    def initialize(
      @hook_result_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @hook_result_id
        params << {"#{prefix}HookResultId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        hook_result_id: Core::XMLValue.string(node.xpath_node("*[local-name()='HookResultId']")),
      )
    end

    def validate! : Nil
      if value = @hook_result_id
        raise Core::ValidationError.new("HookResultId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("HookResultId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("HookResultId does not match the required pattern") unless value.matches?(Regex.new("^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$"))
      end
    end

    def_equals_and_hash(@hook_result_id)
  end
end
