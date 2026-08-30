private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # A summary of the progress of the template generation.
  class TemplateProgress
    # The number of resources that succeeded the template generation.
    property resources_succeeded : Int32 | Nil

    # The number of resources that failed the template generation.
    property resources_failed : Int32 | Nil

    # The number of resources that are in-process for the template generation.
    property resources_processing : Int32 | Nil

    # The number of resources that are still pending the template generation.
    property resources_pending : Int32 | Nil

    def initialize(
      @resources_succeeded : Int32 | Nil = nil,
      @resources_failed : Int32 | Nil = nil,
      @resources_processing : Int32 | Nil = nil,
      @resources_pending : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resources_succeeded
        params << {"#{prefix}ResourcesSucceeded", value.to_s}
      end

      if value = @resources_failed
        params << {"#{prefix}ResourcesFailed", value.to_s}
      end

      if value = @resources_processing
        params << {"#{prefix}ResourcesProcessing", value.to_s}
      end

      if value = @resources_pending
        params << {"#{prefix}ResourcesPending", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resources_succeeded: Core::XMLValue.i32(node.xpath_node("*[local-name()='ResourcesSucceeded']")),
        resources_failed: Core::XMLValue.i32(node.xpath_node("*[local-name()='ResourcesFailed']")),
        resources_processing: Core::XMLValue.i32(node.xpath_node("*[local-name()='ResourcesProcessing']")),
        resources_pending: Core::XMLValue.i32(node.xpath_node("*[local-name()='ResourcesPending']")),
      )
    end

    def validate! : Nil
      if value = @resources_succeeded
        raise Core::ValidationError.new("ResourcesSucceeded value must be >= 0") if value < 0
      end

      if value = @resources_failed
        raise Core::ValidationError.new("ResourcesFailed value must be >= 0") if value < 0
      end

      if value = @resources_processing
        raise Core::ValidationError.new("ResourcesProcessing value must be >= 0") if value < 0
      end

      if value = @resources_pending
        raise Core::ValidationError.new("ResourcesPending value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@resources_succeeded, @resources_failed, @resources_processing, @resources_pending)
  end
end
