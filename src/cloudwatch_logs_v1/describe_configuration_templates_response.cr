module Amazonite::CloudWatchLogsV1
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

    def_equals_and_hash(@configuration_templates, @next_token)
  end
end
