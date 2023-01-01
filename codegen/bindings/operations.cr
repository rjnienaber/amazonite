module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Operations < Base
    @target_prefix : String
    @endpoint_prefix : String
    @json_version : String
    @operations : Array(Crinja::Value)

    getter operations, target_prefix, endpoint_prefix, json_version, has_errors

    def initialize(description : Amazonite::Codegen::Service::Description, has_errors : Bool | Nil = nil)
      metadata = description.metadata
      @has_errors = has_errors.nil? ? description.has_errors : has_errors
      @target_prefix = metadata.target_prefix
      @endpoint_prefix = metadata.endpoint_prefix
      @json_version = metadata.json_version
      @operations = description.operations.map do |o|
        output = if o.output.nil?
                   "Core::Response"
                 else
                   "Core::ParsedResponse(#{description.module_alias}::#{o.output})"
                 end
        Crinja.value({
          function_name: o.lower_name,
          command:       o.name,
          has_input:     !!o.input,
          input:         "#{description.module_alias}::#{o.input}",
          output:        output,
        })
      end
    end
  end
end
