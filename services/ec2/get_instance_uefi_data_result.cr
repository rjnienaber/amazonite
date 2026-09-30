private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetInstanceUefiDataResult
    # The ID of the instance from which to retrieve the UEFI data.
    property instance_id : String | Nil

    # Base64 representation of the non-volatile UEFI variable store.
    property uefi_data : String | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @uefi_data : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @uefi_data
        params << {"#{prefix}UefiData", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        uefi_data: Core::XMLValue.string(node.xpath_node("*[local-name()='uefiData']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @uefi_data)
  end
end
