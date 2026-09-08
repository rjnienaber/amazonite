private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a launch permission modification.
  class LaunchPermissionModifications
    # The Amazon Web Services account ID, organization ARN, or OU ARN to add to the list of launch
    # permissions for the AMI.
    property add : Array(LaunchPermission) | Nil

    # The Amazon Web Services account ID, organization ARN, or OU ARN to remove from the list of
    # launch permissions for the AMI.
    property remove : Array(LaunchPermission) | Nil

    def initialize(
      @add : Array(LaunchPermission) | Nil = nil,
      @remove : Array(LaunchPermission) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@add || [] of LaunchPermission).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Add.#{i}."))
      end

      (@remove || [] of LaunchPermission).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Remove.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        add: node.xpath_nodes("*[local-name()='Add']/*[local-name()='item']").map { |n| LaunchPermission.from_xml(n) },
        remove: node.xpath_nodes("*[local-name()='Remove']/*[local-name()='item']").map { |n| LaunchPermission.from_xml(n) },
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
