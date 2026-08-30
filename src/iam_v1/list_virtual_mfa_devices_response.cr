private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains the response to a successful
  # [ListVirtualMFADevices](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListVirtualMFADevices.html)
  # request.
  class ListVirtualMFADevicesResponse
    # The list of virtual MFA devices in the current account that match the `AssignmentStatus` value
    # that was passed in the request.
    property virtual_mfa_devices : Array(VirtualMFADevice) = [] of VirtualMFADevice

    # A flag that indicates whether there are more items to return. If your results were truncated,
    # you can make a subsequent pagination request using the `Marker` request parameter to retrieve
    # more items. Note that IAM might return fewer than the `MaxItems` number of results even when
    # there are more results available. We recommend that you check `IsTruncated` after every call to
    # ensure that you receive all your results.
    property is_truncated : Bool | Nil

    # When `IsTruncated` is `true`, this element is present and contains the value to use for the
    # `Marker` parameter in a subsequent pagination request.
    property marker : String | Nil

    def initialize(
      @virtual_mfa_devices : Array(VirtualMFADevice),
      @is_truncated : Bool | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @virtual_mfa_devices.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VirtualMFADevices.member.#{i}."))
      end

      if value = @is_truncated
        params << {"#{prefix}IsTruncated", Core::QueryValue.bool(value)}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        virtual_mfa_devices: node.xpath_nodes("*[local-name()='VirtualMFADevices']/*[local-name()='member']").map { |n| VirtualMFADevice.from_xml(n) },
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end

    def_equals_and_hash(@virtual_mfa_devices, @is_truncated, @marker)
  end
end
