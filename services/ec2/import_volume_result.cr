private alias Core = Amazonite::Core

module Amazonite::EC2
  class ImportVolumeResult
    # Information about the conversion task.
    property conversion_task : ConversionTask | Nil

    def initialize(
      @conversion_task : ConversionTask | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @conversion_task
        params.concat(value.to_query_params("#{prefix}ConversionTask."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        conversion_task: node.xpath_node("*[local-name()='conversionTask']").try { |n| ConversionTask.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @conversion_task
        value.validate!
      end
    end

    def_equals_and_hash(@conversion_task)
  end
end
