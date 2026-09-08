private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SnapshotAttributeName
    ProductCodes
    CreateVolumePermission

    def self.to_json(e : SnapshotAttributeName, json : JSON::Builder) : Nil
      value = case e
              when AEC::SnapshotAttributeName::ProductCodes           then "productCodes"
              when AEC::SnapshotAttributeName::CreateVolumePermission then "createVolumePermission"
              else
                raise Exception.new("unknown enum value for 'SnapshotAttributeName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SnapshotAttributeName
      value = pull.read_string
      case value
      when "productCodes"           then AEC::SnapshotAttributeName::ProductCodes
      when "createVolumePermission" then AEC::SnapshotAttributeName::CreateVolumePermission
      else
        raise Exception.new("unknown enum value for 'SnapshotAttributeName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SnapshotAttributeName::ProductCodes           then "productCodes"
      when AEC::SnapshotAttributeName::CreateVolumePermission then "createVolumePermission"
      else
        raise Exception.new("unknown enum value for 'SnapshotAttributeName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SnapshotAttributeName?
      case key
      when "productCodes"           then AEC::SnapshotAttributeName::ProductCodes
      when "createVolumePermission" then AEC::SnapshotAttributeName::CreateVolumePermission
      else
        nil
      end
    end
  end
end
