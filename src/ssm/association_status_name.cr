private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum AssociationStatusName
    Pending
    Success
    Failed

    def self.to_json(e : AssociationStatusName, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AssociationStatusName
      value = pull.read_string
      case value
      when "Pending" then AS::AssociationStatusName::Pending
      when "Success" then AS::AssociationStatusName::Success
      when "Failed"  then AS::AssociationStatusName::Failed
      else
        raise Exception.new("unknown enum value for 'AssociationStatusName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::AssociationStatusName?
      case key
      when "Pending" then AS::AssociationStatusName::Pending
      when "Success" then AS::AssociationStatusName::Success
      when "Failed"  then AS::AssociationStatusName::Failed
      else
        nil
      end
    end
  end
end
