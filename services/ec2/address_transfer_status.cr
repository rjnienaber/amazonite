private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AddressTransferStatus
    Pending
    Disabled
    Accepted

    def self.to_json(e : AddressTransferStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::AddressTransferStatus::Pending  then "pending"
              when AEC::AddressTransferStatus::Disabled then "disabled"
              when AEC::AddressTransferStatus::Accepted then "accepted"
              else
                raise Exception.new("unknown enum value for 'AddressTransferStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AddressTransferStatus
      value = pull.read_string
      case value
      when "pending"  then AEC::AddressTransferStatus::Pending
      when "disabled" then AEC::AddressTransferStatus::Disabled
      when "accepted" then AEC::AddressTransferStatus::Accepted
      else
        raise Exception.new("unknown enum value for 'AddressTransferStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AddressTransferStatus::Pending  then "pending"
      when AEC::AddressTransferStatus::Disabled then "disabled"
      when AEC::AddressTransferStatus::Accepted then "accepted"
      else
        raise Exception.new("unknown enum value for 'AddressTransferStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AddressTransferStatus?
      case key
      when "pending"  then AEC::AddressTransferStatus::Pending
      when "disabled" then AEC::AddressTransferStatus::Disabled
      when "accepted" then AEC::AddressTransferStatus::Accepted
      else
        nil
      end
    end
  end
end
