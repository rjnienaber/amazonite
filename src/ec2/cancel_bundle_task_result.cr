private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of CancelBundleTask.
  class CancelBundleTaskResult
    # Information about the bundle task.
    property bundle_task : BundleTask | Nil

    def initialize(
      @bundle_task : BundleTask | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @bundle_task
        params.concat(value.to_query_params("#{prefix}BundleInstanceTask."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        bundle_task: node.xpath_node("*[local-name()='bundleInstanceTask']").try { |n| BundleTask.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @bundle_task
        value.validate!
      end
    end

    def_equals_and_hash(@bundle_task)
  end
end
