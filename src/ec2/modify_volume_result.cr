private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVolumeResult
    # Information about the volume modification.
    property volume_modification : VolumeModification | Nil

    def initialize(
      @volume_modification : VolumeModification | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @volume_modification
        params.concat(value.to_query_params("#{prefix}VolumeModification."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        volume_modification: node.xpath_node("*[local-name()='volumeModification']").try { |n| VolumeModification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @volume_modification
        value.validate!
      end
    end

    def_equals_and_hash(@volume_modification)
  end
end
