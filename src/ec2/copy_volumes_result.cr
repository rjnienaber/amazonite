private alias Core = Amazonite::Core

module Amazonite::EC2
  class CopyVolumesResult
    # Information about the volume copy.
    property volumes : Array(Volume) | Nil

    def initialize(
      @volumes : Array(Volume) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@volumes || [] of Volume).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VolumeSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        volumes: node.xpath_nodes("*[local-name()='volumeSet']/*[local-name()='item']").map { |n| Volume.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @volumes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@volumes)
  end
end
