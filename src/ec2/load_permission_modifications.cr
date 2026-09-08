private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes modifications to the load permissions of an Amazon FPGA image (AFI).
  class LoadPermissionModifications
    # The load permissions to add.
    property add : Array(LoadPermissionRequest) | Nil

    # The load permissions to remove.
    property remove : Array(LoadPermissionRequest) | Nil

    def initialize(
      @add : Array(LoadPermissionRequest) | Nil = nil,
      @remove : Array(LoadPermissionRequest) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@add || [] of LoadPermissionRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Add.#{i}."))
      end

      (@remove || [] of LoadPermissionRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Remove.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        add: node.xpath_nodes("*[local-name()='Add']/*[local-name()='item']").map { |n| LoadPermissionRequest.from_xml(n) },
        remove: node.xpath_nodes("*[local-name()='Remove']/*[local-name()='item']").map { |n| LoadPermissionRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @add
        value.each(&.validate!)
      end

      if value = @remove
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@add, @remove)
  end
end
