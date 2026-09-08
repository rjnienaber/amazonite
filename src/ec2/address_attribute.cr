private alias Core = Amazonite::Core

module Amazonite::EC2
  # The attributes associated with an Elastic IP address.
  class AddressAttribute
    # The public IP address.
    property public_ip : String | Nil

    # [EC2-VPC] The allocation ID.
    property allocation_id : String | Nil

    # The pointer (PTR) record for the IP address.
    property ptr_record : String | Nil

    # The updated PTR record for the IP address.
    property ptr_record_update : PtrUpdateStatus | Nil

    def initialize(
      @public_ip : String | Nil = nil,
      @allocation_id : String | Nil = nil,
      @ptr_record : String | Nil = nil,
      @ptr_record_update : PtrUpdateStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @public_ip
        params << {"#{prefix}PublicIp", value}
      end

      if value = @allocation_id
        params << {"#{prefix}AllocationId", value}
      end

      if value = @ptr_record
        params << {"#{prefix}PtrRecord", value}
      end

      if value = @ptr_record_update
        params.concat(value.to_query_params("#{prefix}PtrRecordUpdate."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        public_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='publicIp']")),
        allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='allocationId']")),
        ptr_record: Core::XMLValue.string(node.xpath_node("*[local-name()='ptrRecord']")),
        ptr_record_update: node.xpath_node("*[local-name()='ptrRecordUpdate']").try { |n| PtrUpdateStatus.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ptr_record_update
        value.validate!
      end
    end

    def_equals_and_hash(@public_ip, @allocation_id, @ptr_record, @ptr_record_update)
  end
end
