private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  # Specifies how pending replication is handled before a replica is disassociated.
  # `WAIT_FOR_REPLICATION` is the only supported value.
  enum DisassociationMode
    WaitForReplication

    def self.to_json(e : DisassociationMode, json : JSON::Builder) : Nil
      value = case e
              when ADDB::DisassociationMode::WaitForReplication then "WAIT_FOR_REPLICATION"
              else
                raise Exception.new("unknown enum value for 'DisassociationMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::DisassociationMode
      value = pull.read_string
      case value
      when "WAIT_FOR_REPLICATION" then ADDB::DisassociationMode::WaitForReplication
      else
        raise Exception.new("unknown enum value for 'DisassociationMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::DisassociationMode::WaitForReplication then "WAIT_FOR_REPLICATION"
      else
        raise Exception.new("unknown enum value for 'DisassociationMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::DisassociationMode?
      case key
      when "WAIT_FOR_REPLICATION" then ADDB::DisassociationMode::WaitForReplication
      else
        nil
      end
    end
  end
end
