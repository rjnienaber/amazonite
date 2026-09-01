private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum ManagedStatus
    All
    Managed
    Unmanaged

    def self.to_json(e : ManagedStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ManagedStatus
      value = pull.read_string
      case value
      when "All"       then AS::ManagedStatus::All
      when "Managed"   then AS::ManagedStatus::Managed
      when "Unmanaged" then AS::ManagedStatus::Unmanaged
      else
        raise Exception.new("unknown enum value for 'ManagedStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::ManagedStatus?
      case key
      when "All"       then AS::ManagedStatus::All
      when "Managed"   then AS::ManagedStatus::Managed
      when "Unmanaged" then AS::ManagedStatus::Unmanaged
      else
        nil
      end
    end
  end
end
