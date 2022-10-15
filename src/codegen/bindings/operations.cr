module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Operations < Base
    @target_prefix : String
    @endpoint_prefix : String
    @operations : Array(Crinja::Value)

    getter operations, target_prefix, endpoint_prefix

    def initialize(
      metadata : Amazonite::Codegen::Service::Metadata,
      operations : Array(Amazonite::Codegen::Service::Operation)
    )
      module_name = "Amazonite::#{metadata.service_id}"
      @target_prefix = metadata.target_prefix
      @endpoint_prefix = metadata.endpoint_prefix
      @operations = operations.map do |o|
        output = if o.output.nil?
                   "Amazonite::Core::Response"
                 else
                   "Amazonite::Core::ParsedResponse(#{module_name}::#{o.output})"
                 end
        Crinja.value({
          function_name: o.lower_name,
          command:       o.name,
          has_input:     !!o.input,
          input:         "#{module_name}::#{o.input}",
          output:        output,
        })
      end
    end
  end
end
