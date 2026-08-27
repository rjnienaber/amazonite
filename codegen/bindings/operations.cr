module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Operations < Base
    @target_prefix : String
    @endpoint_prefix : String
    @json_version : String
    @operations : Array(Crinja::Value)

    getter operations, target_prefix, endpoint_prefix, json_version, has_errors

    def initialize(description : Amazonite::Codegen::Service::Description, has_errors : Bool? = nil)
      metadata = description.metadata
      @has_errors = has_errors.nil? ? description.has_errors : has_errors
      @target_prefix = metadata.target_prefix
      @endpoint_prefix = metadata.endpoint_prefix
      @json_version = metadata.json_version
      @operations = description.operations.map do |operation|
        output = if operation.output.nil?
                   "Core::Response"
                 else
                   "Core::ParsedResponse(#{description.module_alias}::#{operation.output})"
                 end
        Crinja.value({
          function_name: operation.lower_name,
          command:       operation.name,
          has_input:     !!operation.input,
          input:         "#{description.module_alias}::#{operation.input}",
          output:        output,
        })
      end
    end
  end
end
