private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes modifications to the list of create volume permissions for a volume.
  class CreateVolumePermissionModifications
    # Adds the specified Amazon Web Services account ID or group to the list.
    property add : Array(CreateVolumePermission) | Nil

    # Removes the specified Amazon Web Services account ID or group from the list.
    property remove : Array(CreateVolumePermission) | Nil

    def initialize(
      @add : Array(CreateVolumePermission) | Nil = nil,
      @remove : Array(CreateVolumePermission) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@add || [] of CreateVolumePermission).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Add.#{i}."))
      end

      (@remove || [] of CreateVolumePermission).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Remove.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        add: node.xpath_nodes("*[local-name()='Add']/*[local-name()='item']").map { |n| CreateVolumePermission.from_xml(n) },
        remove: node.xpath_nodes("*[local-name()='Remove']/*[local-name()='item']").map { |n| CreateVolumePermission.from_xml(n) },
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
