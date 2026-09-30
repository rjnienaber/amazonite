private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateMacSystemIntegrityProtectionModificationTaskResult
    # Information about the SIP modification task.
    property mac_modification_task : MacModificationTask | Nil

    def initialize(
      @mac_modification_task : MacModificationTask | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @mac_modification_task
        params.concat(value.to_query_params("#{prefix}MacModificationTask."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        mac_modification_task: node.xpath_node("*[local-name()='macModificationTask']").try { |n| MacModificationTask.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @mac_modification_task
        value.validate!
      end
    end

    def_equals_and_hash(@mac_modification_task)
  end
end
