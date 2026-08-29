private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateVirtualMFADeviceRequest
    property path : String | Nil

    property virtual_mfa_device_name : String

    property tags : Array(Tag) | Nil

    def initialize(
      @virtual_mfa_device_name : String,
      @path : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      params << {"#{prefix}VirtualMFADeviceName", @virtual_mfa_device_name}

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        virtual_mfa_device_name: Core::XMLValue.string(node.xpath_node("*[local-name()='VirtualMFADeviceName']")).not_nil!,
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
