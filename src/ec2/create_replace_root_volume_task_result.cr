private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateReplaceRootVolumeTaskResult
    # Information about the root volume replacement task.
    property replace_root_volume_task : ReplaceRootVolumeTask | Nil

    def initialize(
      @replace_root_volume_task : ReplaceRootVolumeTask | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @replace_root_volume_task
        params.concat(value.to_query_params("#{prefix}ReplaceRootVolumeTask."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        replace_root_volume_task: node.xpath_node("*[local-name()='replaceRootVolumeTask']").try { |n| ReplaceRootVolumeTask.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @replace_root_volume_task
        value.validate!
      end
    end

    def_equals_and_hash(@replace_root_volume_task)
  end
end
