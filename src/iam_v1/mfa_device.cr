private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about an MFA device.
  #
  # This data type is used as a response element in the
  # [ListMFADevices](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListMFADevices.html)
  # operation.
  class MFADevice
    # The user with whom the MFA device is associated.
    property user_name : String

    # The serial number that uniquely identifies the MFA device. For virtual MFA devices, the serial
    # number is the device ARN.
    property serial_number : String

    # The date when the MFA device was enabled for the user.
    property enable_date : Time

    def initialize(
      @user_name : String,
      @serial_number : String,
      @enable_date : Time,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}SerialNumber", @serial_number}

      params << {"#{prefix}EnableDate", Core::QueryValue.time(@enable_date)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")).not_nil!,
        enable_date: Core::XMLValue.time(node.xpath_node("*[local-name()='EnableDate']")).not_nil!,
      )
    end
  end
end
