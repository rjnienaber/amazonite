private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class DescribeConfigurationTemplatesResponse
    include JSON::Serializable

    # An array of objects, where each object describes one configuration template that matches the
    # filters that you specified in the request.
    @[JSON::Field(key: "configurationTemplates")]
    property configuration_templates : Array(ConfigurationTemplate) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @configuration_templates : Array(ConfigurationTemplate) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @configuration_templates
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@configuration_templates, @next_token)
  end
end
