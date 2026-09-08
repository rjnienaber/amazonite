private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ImportInstanceRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # A description for the instance being imported.
    property description : String | Nil

    # The launch specification.
    property launch_specification : ImportInstanceLaunchSpecification | Nil

    # The disk image.
    property disk_images : Array(DiskImage) | Nil

    # The instance operating system.
    property platform : PlatformValues

    def initialize(
      @platform : PlatformValues,
      @dry_run : Bool | Nil = nil,
      @description : String | Nil = nil,
      @launch_specification : ImportInstanceLaunchSpecification | Nil = nil,
      @disk_images : Array(DiskImage) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @launch_specification
        params.concat(value.to_query_params("#{prefix}LaunchSpecification."))
      end

      (@disk_images || [] of DiskImage).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}DiskImage.#{i}."))
      end

      params << {"#{prefix}Platform", @platform.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        launch_specification: node.xpath_node("*[local-name()='launchSpecification']").try { |n| ImportInstanceLaunchSpecification.from_xml(n) },
        disk_images: node.xpath_nodes("*[local-name()='diskImage']/*[local-name()='item']").map { |n| DiskImage.from_xml(n) },
        platform: ((n = node.xpath_node("*[local-name()='platform']")) ? AEC::PlatformValues.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
      if value = @launch_specification
        value.validate!
      end

      if value = @disk_images
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @description, @launch_specification, @disk_images, @platform)
  end
end
