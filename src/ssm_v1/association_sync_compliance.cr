private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum AssociationSyncCompliance
    Auto
    Manual

    def self.to_json(e : AssociationSyncCompliance, json : JSON::Builder) : Nil
      value = case e
              when AS::AssociationSyncCompliance::Auto   then "AUTO"
              when AS::AssociationSyncCompliance::Manual then "MANUAL"
              else
                raise Exception.new("unknown enum value for 'AssociationSyncCompliance' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AssociationSyncCompliance
      value = pull.read_string
      case value
      when "AUTO"   then AS::AssociationSyncCompliance::Auto
      when "MANUAL" then AS::AssociationSyncCompliance::Manual
      else
        raise Exception.new("unknown enum value for 'AssociationSyncCompliance' when deserializing from json: '#{value}'")
      end
    end
  end
end
