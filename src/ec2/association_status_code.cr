private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AssociationStatusCode
    Associating
    Associated
    AssociationFailed
    Disassociating
    Disassociated

    def self.to_json(e : AssociationStatusCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::AssociationStatusCode::Associating       then "associating"
              when AEC::AssociationStatusCode::Associated        then "associated"
              when AEC::AssociationStatusCode::AssociationFailed then "association-failed"
              when AEC::AssociationStatusCode::Disassociating    then "disassociating"
              when AEC::AssociationStatusCode::Disassociated     then "disassociated"
              else
                raise Exception.new("unknown enum value for 'AssociationStatusCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AssociationStatusCode
      value = pull.read_string
      case value
      when "associating"        then AEC::AssociationStatusCode::Associating
      when "associated"         then AEC::AssociationStatusCode::Associated
      when "association-failed" then AEC::AssociationStatusCode::AssociationFailed
      when "disassociating"     then AEC::AssociationStatusCode::Disassociating
      when "disassociated"      then AEC::AssociationStatusCode::Disassociated
      else
        raise Exception.new("unknown enum value for 'AssociationStatusCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AssociationStatusCode::Associating       then "associating"
      when AEC::AssociationStatusCode::Associated        then "associated"
      when AEC::AssociationStatusCode::AssociationFailed then "association-failed"
      when AEC::AssociationStatusCode::Disassociating    then "disassociating"
      when AEC::AssociationStatusCode::Disassociated     then "disassociated"
      else
        raise Exception.new("unknown enum value for 'AssociationStatusCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AssociationStatusCode?
      case key
      when "associating"        then AEC::AssociationStatusCode::Associating
      when "associated"         then AEC::AssociationStatusCode::Associated
      when "association-failed" then AEC::AssociationStatusCode::AssociationFailed
      when "disassociating"     then AEC::AssociationStatusCode::Disassociating
      when "disassociated"      then AEC::AssociationStatusCode::Disassociated
      else
        nil
      end
    end
  end
end
